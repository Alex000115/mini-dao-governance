const DAO_ADDRESS = "PASTE_DAO_ADDRESS";

const ABI = [
  "function createProposal(string,uint)",
  "function vote(uint,bool)",
  "function execute(uint)"
];

let signer;
let dao;

const statusEl = document.getElementById("status");

document.getElementById("connect").onclick = async () => {
  const provider = new ethers.BrowserProvider(window.ethereum);
  await provider.send("eth_requestAccounts", []);
  signer = await provider.getSigner();
  dao = new ethers.Contract(DAO_ADDRESS, ABI, signer);

  statusEl.innerText = "Connected";
};

document.getElementById("create").onclick = async () => {
  const desc = document.getElementById("desc").value;
  const dur = document.getElementById("duration").value;

  const tx = await dao.createProposal(desc,dur);
  await tx.wait();

  statusEl.innerText = "Proposal created";
};

document.getElementById("yes").onclick = async () => {
  const id = document.getElementById("voteId").value;
  const tx = await dao.vote(id,true);
  await tx.wait();
  statusEl.innerText = "Voted YES";
};

document.getElementById("no").onclick = async () => {
  const id = document.getElementById("voteId").value;
  const tx = await dao.vote(id,false);
  await tx.wait();
  statusEl.innerText = "Voted NO";
};

document.getElementById("execute").onclick = async () => {
  const id = document.getElementById("execId").value;
  const tx = await dao.execute(id);
  await tx.wait();
  statusEl.innerText = "Executed";
};
