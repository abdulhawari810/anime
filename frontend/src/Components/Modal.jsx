export default function Modal({ isOpen, onClose, children }) {
  if (!isOpen) return null;

  return (
    <>
      <div className="fixed lg:w-[40%] md:w-[50%] lg:h-[50%] right-0 flex items-center justify-end top-20 md:top-[100px] lg:top-[170px] md:right-0 lg:right-0 sm:w-auto px-10 rounded-lg z-50">
        {children}
      </div>
    </>
  );
}
