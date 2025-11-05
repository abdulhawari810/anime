export default function Modal({ isOpen, onClose, children }) {
  if (!isOpen) return null;

  return (
    <>
      <div className="fixed top-[100px] right-[150px] bg-white w-auto h-auto">
        {children}
      </div>
    </>
  );
}
