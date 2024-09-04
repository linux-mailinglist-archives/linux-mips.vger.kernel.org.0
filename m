Return-Path: <linux-mips+bounces-5327-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 081E596B47F
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 10:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76551F25B0A
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 08:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C70185955;
	Wed,  4 Sep 2024 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4Ct3qLx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C022C181;
	Wed,  4 Sep 2024 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438537; cv=none; b=bxZPz02/kifdFlCAEDIaQeWqRFGKKJ1WH0AlLgS7opirJZDzuOaMu3u1KL52QD7gUKDs/o+2n/BAJDS3dKcjoL5FNbXsLq7Axw/rBtXh8HqThjXsXv3ABFzSAujHLXNLIG70Dt5Ecz2t9lY7wDvANuEMkp1Dm0mnxdTgBEklmlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438537; c=relaxed/simple;
	bh=jdt4L7B/HVtgHJTf5Ay/37Kjc9tEjPIOz23j2vKvezg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEBbS9IiGA9DA5KfbTrCe5kJ9hnCM3Kn5Zm7H3Nhy13kKpO9YrUjdA+dEreIqjc3ISMDQj8mi4vq33yWrYf3m6DQv69B0mqwfeK0RfzgVaD/AlNmu/RvLzNwfzwzoD3GN1+KPNCPe29j+QCSZvo114z/sq4IRuWmwmrCwhGJDeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4Ct3qLx; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70f6320ae4fso317010a34.2;
        Wed, 04 Sep 2024 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725438535; x=1726043335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdt4L7B/HVtgHJTf5Ay/37Kjc9tEjPIOz23j2vKvezg=;
        b=S4Ct3qLxmBYMjktvvXlK2fop5lZ5GvBIvw2BUuMZMTHrufPSBjE085ZrsJw3XYN+g+
         kJMm9bJd3xQo3MrJybuRqf1CUHwmOy3vHRHJ4MBRWigVeIMR5z4i1M3uWnDD68lBVDJz
         Bc6nSl6z2dQdvG4cwZdphh4sQpNp2xJvSpPaSA0JEj0/Zbw1RviB9hrH7c55Uu2MSoex
         ZIW8KcjM+HM35mWE8lM2+nhq9Uhwdr5/c5Z6d/j+yk+E+YY7Q8l0jJJf9RZlBuj/JOiZ
         p/rB8NaAP4+DwM1SJBFNbKFwkKv81OFAg5vCp6rqGG23pfTc+dGhW+N25ReHjbZC/sOQ
         my0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725438535; x=1726043335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdt4L7B/HVtgHJTf5Ay/37Kjc9tEjPIOz23j2vKvezg=;
        b=CY9e251gzfAcCqg0QL50FNj0fBM7w15S/KLdPcQ8Yl2OR2hoM8pfRvu4g+XUG0ntQG
         vJqtkTC0Jqd6uAYoQBhRKfc890UKEOW4YtaLaG1gWLzb3jzrjL8Xs/OwBoGUw5DI/lfy
         Uq+Q6S2G2AXv4DaXDPutzfYHMdIrxNEfSWVQFSldWCkOojzG8AytdvvwGjrLTYnZ1yNI
         VEGNMTM0Mq8q36Zf3MhXyDMBHnXcYRDwjH+k3lYqTPlrbEQXJGa8yjg+IlUno9U22A4h
         97Cv4F1hT/r4OZxaStLoZBm5xjPeJSfq0WedEzrtdG3DHqM6jKstOzJefQXIAeP+knju
         RjyA==
X-Forwarded-Encrypted: i=1; AJvYcCUocaWFBAQp79c2iaIOkdi+0RvQuuyjOHSvzMIWIkP1MkN2uAycUHAxkYuYkk+WCaCASJAXc6ruqaydEMOYpXXd06Gz@vger.kernel.org, AJvYcCVPtukyDR+u+LZWY/ICHCNh1G6RROT4PO1CpJq+a72IrTOOGGV3sWab9haerM+3apW5oC46WwjCO2LXBcPV@vger.kernel.org, AJvYcCVVTxeywoxjVyTqJeDkcBteBMeeHxuV56MlWEo2eI4jvImo0oNhGmolUGLuobNZ4aeWQf55CBh9fDLzE9QIHFA=@vger.kernel.org, AJvYcCW6v3y4OdYBoz0whfyOlgqZiW3zg/EZRy8FSe4VoxEttMKGAZW8hg6OeSVi/vNDYF6kQtjPrQJknJwkkg==@vger.kernel.org, AJvYcCWu5Z+9JF2kJ3d6S9rCKBuettvnp+xImIrk7VPqHDrWgiPsM6QGfo4m0l9mPo8iKwIdMKnLljSHBOI=@vger.kernel.org, AJvYcCX2iM8bnAghQN9pubEAE3zif19rr8hduP1/g+PkxaOAk/YofpOXFfBUe1/WFgXUHuBVvz2tJs+wu5uMZkj0@vger.kernel.org
X-Gm-Message-State: AOJu0YxR93aIs3/R5qmLywVxOFAbeN0CKZAkQ4hjoLMt0KvHredmsmmD
	CuJihldYnZd5ay2gpCQGSKrdiR37v8kLWSyK9gN/GSR33Hfgeh0vB1R6+THBRWhBt4n0vO5zw8m
	6xfSbfpHBGN4CABOj/k5MjnK0xVY=
X-Google-Smtp-Source: AGHT+IG7ayScQVV2ACfQehNhc8C8kUzsvNWbtTACdA8kQELKf2OV6f3hSmmCq0rgCq8R7f/fWdFT+b2PvKUGt44U9CM=
X-Received: by 2002:a05:6359:4c93:b0:1ac:a26c:9e91 with SMTP id
 e5c5f4694b2df-1b7e39c063dmr1048812355d.4.1725438534828; Wed, 04 Sep 2024
 01:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com> <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com> <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
 <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com> <CANiq72mvTTgyTjDCWBz_kOdY1f4gopAtWxyC4P4c+Lr0YVkzLA@mail.gmail.com>
 <a6959bc0-f0bb-425b-b3b1-3123d3b809b5@app.fastmail.com>
In-Reply-To: <a6959bc0-f0bb-425b-b3b1-3123d3b809b5@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Sep 2024 10:28:42 +0200
Message-ID: <CANiq72mjKEpaBqKccZPiNzpsJL65jb2zp9Ve4FHK0fRd014ACw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Enable for MIPS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 9:38=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> Reported at:
> https://github.com/rust-embedded/wg/issues/792#issuecomment-2328133517

Thanks for the link! Added to our bullet point about the target spec
file in https://github.com/Rust-for-Linux/linux/issues/2.

Cheers,
Miguel

