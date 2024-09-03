Return-Path: <linux-mips+bounces-5307-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D096A5AA
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0691F256FC
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 17:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5217719046D;
	Tue,  3 Sep 2024 17:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DL+Zkxo+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8119005F;
	Tue,  3 Sep 2024 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385537; cv=none; b=Rwx3O899dmwyOTS7THPsDgXxRJrfi1YxqxnTYWkGuV6P5KACf5gg74dBEpxFUOV8OzS7udqBqDqLlSRgMob9RZbN8Nt260RGs2w3g1J1epnCwwIvSHNQsLrqD4xac295B+YIRdSkN0DQo6wtdpjxYcxrcBAL9cMpIeZb9juEBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385537; c=relaxed/simple;
	bh=0DofYcV1Ki+ENSwTIpZw+asSjmZojx2JbABHePOoO20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cp2ajpEKxKQ0VDf/CQKyiC+SfMQwFzhiSWMjKwi9vBb9ssQIICIiJLZVTQl5ZhBvYCSoG5uGxkO9J7lV9ndj+7sJ1vLheA130oRf4GujBiOMsfkLq2YCO5Iy+hStrQGKILqJBgnCr4Fss5goed148+qfp+8ROAHaRDiYQF18bHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DL+Zkxo+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d8a9a15a7fso247656a91.0;
        Tue, 03 Sep 2024 10:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385535; x=1725990335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DofYcV1Ki+ENSwTIpZw+asSjmZojx2JbABHePOoO20=;
        b=DL+Zkxo+Ms9QJVPjChSpFey63y8d+E1zAYhwtASwk8O9muz6o2tlBek+f/CfpW9h43
         RS0TC3wWBlZ9ERhIm9k28kltCcxjtXMFwjczXDxrcgpqyetpNX6NPBA2Pgab9RMbHRLr
         WSn4aevSwDNYeNal81YTZ5bm9OeC0fnmeFqNuTmlBFFha4YnCzYUeXfLxhroAaXLW6bC
         G5jNVV4qM2pv2rw+hphg2IBgVdEzrXlyuBoyEIhWnF5W0RofqQxmOaNdO3kZy3UrCMUM
         Y1N/oWcX7zBTGxpE/Uto54ZzGA4pY83kifga51EdoL+9sYYl716Y68ZHG07lTrMNm9Kv
         PYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385535; x=1725990335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DofYcV1Ki+ENSwTIpZw+asSjmZojx2JbABHePOoO20=;
        b=LXCq2c0+VPC5ZkN3MBgCr/886AMCtORFugL1vhvA+r4UYd8NKhy4azRnbAJJXNfRut
         GqvENn6jRiv4TtVCIE5Hiv/Wff9hYeWb9jEYiSpciICkKmNDv7ZyH7DXehpaQDVPkeI1
         W5i+dGdK0CcVdIW+jsxjN3xnFcQ9+2xpL0QhxLhstnhghal84RSxF/hywg5reHW45OXu
         qIpO+1rfHavmS1xAuA4dn3upWt5WBNAhYv6EwQE3VuxiIygJYf9GacG5q9/aAsEBOI+Q
         APuyiB/CEniPEPKsHryVleSA6h5vdO/YXkRuukPTZAPp9NHZLyiWbtUVvoWpaT1pMLrU
         p7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9QnbM5LfiL9KQc3gGIIkpMRVOQKQmms1N93yrTX6KlSROl+lswzl9sUu38/6RmdCcQdR0sniiunnUM+XS@vger.kernel.org, AJvYcCVL4p82Vmyqe0OKH9G3ijJCA7xK07UWjZT6pHWKXJJtdMaAgMlFv4U2noHwAhRCJBQcnLLxgcrMPBo9tD2C@vger.kernel.org, AJvYcCWVxu1I6w3ymgy3dEdmWzIENTlGtenMG2FMz66Y0uNt/cve2Aae/uNiaPyQRlkgFkfvgffwkMrW+0Yvug==@vger.kernel.org, AJvYcCWWIzTsXAvmwjpm6/gdj9PqvHtTbtTnnG7uzFhpjBV6vOAoRARUC/ndTkXo050knOewJR19eTYbLu3NhcEaG44=@vger.kernel.org, AJvYcCWmf2/Ay0G/c4ATtEtgnkYIiRBFBt4TRSB/U+pVm1ksoXNnMSKcLAX06RtHhXsISbFjjqDNiHnJpd4=@vger.kernel.org, AJvYcCXbSedUnyvVUhhkspVzCptMA5v9nyHP6JdMujbum+4JEu5LWoOSKltiGbUvCsA+RikMt7ovrlBeJZVMsJVN2U1EmMAJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsXTl7vqI/Mf1teaCnJqiL9BV/AAe2OOcguU63hW9O3ZL+Yt5
	Gl7wjFbx1KuvWdk0bPFNfgR+cFhWD4G9HVw+kXrohldSLWrqMGSgCPH4k+Ne7ThMlZi84xO8CV7
	FXsU9z7o9M7kR3IT2p6wHa/0kWr0=
X-Google-Smtp-Source: AGHT+IGSJaGwOM9WSS6C4CfJ5n+iQPEV9+ern3LlVZwrkMxCoO8ICwpxdMLXqIAiQmi7uSiY7KxVOTk+pY+MMkXUU6k=
X-Received: by 2002:a17:90b:207:b0:2d8:792e:9b22 with SMTP id
 98e67ed59e1d1-2d8792e9cc0mr7985254a91.0.1725385535089; Tue, 03 Sep 2024
 10:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:45:22 +0200
Message-ID: <CANiq72nG-7Zbd11S=VkMdhpSON8vJOpDe4qhGy3czrKgrJ0DXA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Initial MIPS support
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
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:14=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> This series added MIPS arch support to rust for linux,
> hopefully MIPS is not too late to the party :-)

Definitely not late :)

> Sample rust module tested on R4000(el),mips32,mips32r2el,mips64,
> mips64r2el,mips64r6el.

That is great, thanks for this!

Cheers,
Miguel

