Return-Path: <linux-mips+bounces-5310-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41996A5FF
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A3E1C212A8
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 17:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C363D18F2DA;
	Tue,  3 Sep 2024 17:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="ySxNEsvV"
X-Original-To: linux-mips@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032BD22F11;
	Tue,  3 Sep 2024 17:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386290; cv=none; b=uPZI87/0LH2NUEqqbnsSggMSxer8dMooDTTAW0DA1uS2om4cY75NBi5AIP6l+S3IQgUDg8Bx75dNcfMqDJWZkx/nouqFk7hq/NIGOLNNJfE/RGSjWBU9vXQRbAQvcDWeBFJGDLCtM6TfvXGXLFf82Fc6w14dKPkW2isBTOqaN5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386290; c=relaxed/simple;
	bh=u8j2kWJdK0EeKzN4AXVT6Du9D/Kibugx0Xb60H3LWpo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+1JISBUsJf3w9kBKxtGjO6LE6RgjTKcrBMQfsNFM4KmU5amWAxoui0lRWmWvvQKVRYuHW060YZOLr3iyM4bnBsdldIRGQPg5pWZikzAvF2xAuuSpWGVSwkw1D/gSSnzd55mIYZv+q7UCnr4V8Yb+elVMqFdNsRk9A28KX/F3go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=ySxNEsvV; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IAESczAqoTkqwd1sElm2y6U2dzgfrcTnXqQTQycwhtw=;
	t=1725386289; x=1726595889; b=ySxNEsvV1jpF4z8YVdISeGjRSRW+R+vRFyjwpbjNIzJ5Mvq
	zp0z+XLLHRrzXNZtaVR866mGPHDGgaJYhDA3Xx+7eOsr60z38iUR4LSvtVfxh+16S4VIrkAAvGg2N
	hFcvfZadJgvbExtfHuPhSghgrvar0hgI+8h8tLKKrBrnyQLUYjcbPgMAE6rbeUK2BcInpWJgf2r5A
	up6mqJjKEsFhn/VzTN/3F5CCVDn01gdRcP9D8gjoFu40MFAK0JiJhMh2+vSZDbv89G8Olyvv5U948
	vCJGJV6awP3Ni7tHoU451oNrAw4Mbdcq16qpcZmoc4XPjqtfX6uweD9s9TS+GNew==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1slXmU-00000002un7-3JPR;
	Tue, 03 Sep 2024 19:57:31 +0200
Message-ID: <a163db239ffe31fbe1921f8b0bfdcfa47fd355f0.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config
 option
From: Johannes Berg <johannes@sipsolutions.net>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, Thomas Gleixner
 <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,  Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice
 Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Corbet <corbet@lwn.net>,  Alex Shi <alexs@kernel.org>, Yanteng Si
 <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Date: Tue, 03 Sep 2024 19:57:29 +0200
In-Reply-To: <20240903-mips-rust-v1-1-0fdf0b2fd58f@flygoat.com>
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
	 <20240903-mips-rust-v1-1-0fdf0b2fd58f@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2024-09-03 at 18:14 +0100, Jiaxun Yang wrote:
>=20
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -32,6 +32,7 @@ config UML
>  	select TTY # Needed for line.c
>  	select HAVE_ARCH_VMAP_STACK
>  	select HAVE_RUST
> +	select HAVE_GENERATE_RUST_TARGET if X86_32 || X86_64
>=20

There are no other sub-arches support for UML, I don't see much point in
adding the dependency here.

johannes

