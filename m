Return-Path: <linux-mips+bounces-11654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610A0BC8C05
	for <lists+linux-mips@lfdr.de>; Thu, 09 Oct 2025 13:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0E642179F
	for <lists+linux-mips@lfdr.de>; Thu,  9 Oct 2025 11:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9132E0B5B;
	Thu,  9 Oct 2025 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNoiJ37l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879E2DFA3A
	for <linux-mips@vger.kernel.org>; Thu,  9 Oct 2025 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008783; cv=none; b=aNTuUw55jxf9XE0u4MEloQlFAolG5Gx8WJSYqsfRxmTPs0eTL+weFVy5X8jOBoJLflHPTH7aAFO+5zzM084nBFhoCmeGx7euXKm+l+eYp1oXPpN5iqI9w8HZtwyq8YUIIRdwfO918YBf/kgvKyX40X/D68bPL4SHT4yvwTiZVxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008783; c=relaxed/simple;
	bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKlocSxO9O6ESL9ru4p2EL2BsQLu2IgRhCW6g4xKZAlnKCVpJr1S/NzcmbijVR+Y1ENBqi6nLOjwAVBTAYN+m93NG6Q12Etm2R1rycwihGJcz/dAw08esuVcaweCM+gIEtm6Fic71Djk4FmYUBQRhMxCIkFgUK4uupHzuw88QI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNoiJ37l; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63bbf5f77daso838272d50.3
        for <linux-mips@vger.kernel.org>; Thu, 09 Oct 2025 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008779; x=1760613579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=jNoiJ37lCUQ9Hrm2hMpur0n3OpmXylsTAvQFzFo0gEHLdPW1H7xLOEfZx9IMP3xJGG
         VvaFojxgSsr0dFIBvT0p9gx6C2qVKiKNUQeCfRio9yhV6GZjq9rpyyrteqxqW9Ew3dBm
         wtvaqMjirKwpcBo4MgJpiCLn7sWEkQpEyqFiwGTjc5zHrlT4QCRizWiXWVk6zMf3FYYn
         bzUTIQSKLADIffCIHWelPhf43EqQYtzVSfMGzuGbrzIwj9QJsP6FN+oluyC+bzTKhDgF
         5nZ3Uo6yeEy5h0e9DLaazODqWGp9Q080LEkzOtn2P2FcQKQiw+6Kon0LQ4PFBZDDcg2+
         Grtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008779; x=1760613579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=Pi4RRFmM0uN4Cas5+b/6n+AMkOsxSJd/2kBnlWsnGMzGDhBt7qA2HdaRmvcc56qoEF
         Zj1BH2gPKOIHFw2ZoS4F8one1B4UqfffCEdPJO9MSdQe7o6awxaJxFrQcE2cOJTezGA7
         pg8WWVPBSn2STKgU5x5N1BHggbyhBxjFKGmX6jjrcb1ghwiyNdbGWCLVon0FX1tWAwaG
         8hx3JsnBDfnKEEYRB7noEyy+xaJhTDetqZUgD2w84ArZ5u4zD9P0pFsOPzD0ljCeB85O
         XGx6hkbU8LXKTZjanMfIKdFjg5m0uVH3CTHnoQjlix1bPfZMw7pseAAFfgbnpNs+LIZ+
         8a1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUq3JS7YB5/OsPiPUYkz8KWC3E+ifFaqhK/CQKWb1g3hNEeHCK2vpr0fLjr+grHXrvhmX5nNCddQuoz@vger.kernel.org
X-Gm-Message-State: AOJu0YzfEstTzwLanyIKUt8mA9cz8xm91/PdFWjGT4FcCtFuu/LKzNPE
	tB9b1F9cq4p+VF3soa0SFB2FlkDzer3TGTC2+itca/68Rqs2PShNANw0+TIOrGpfZaXVs7HFw/m
	b3QOgQbNS51CmbNar2mWLTQm9kbBfIjA=
X-Gm-Gg: ASbGnctfo8oEYI8nge5BLYoRiVEhb5XaegVydjUzUYazfQWE+zq+NZmB8VpIDSk0vXZ
	87gCjbBcY6ryGmeNcAShx1/q3Ek8p6bw4439FTioxpgC53p79f9fGyg9SXfcuHgG7lI7T2FUZeZ
	1y4rDj2iTop+Dv1dcIh5VNYS5meSFkq4uG298ifQ4SQYH27tiOMHSRlhhZ6pQmOUnixbBbi3wQ2
	d4imxZO0yv7XmHM/3+QtZGafQbZdWE=
X-Google-Smtp-Source: AGHT+IE5U7JyGi1AmeLjDi25hUOta+sU2hpJbVTN9Ai63ARDyOdLqRjdCN3h5Wr4u+tqZlHZJ+/pg/7Xr5jCWFq4BIc=
X-Received: by 2002:a53:d048:0:10b0:63b:8e80:c017 with SMTP id
 956f58d0204a3-63ccb672a0emr6807745d50.0.1760008779377; Thu, 09 Oct 2025
 04:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local> <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
In-Reply-To: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 14:19:03 +0300
X-Gm-Features: AS18NWAGN6ExXhEWeXK-ERFvGpf6JdjWShiWpIPYOnPjMCR9bXVHwIY8E_1WxIc
Message-ID: <CAPnZJGBwFqNAybORpTtRfjtGwMQiBtd+rATD=mh8ZgE3owT_ow@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Borislav Petkov <bp@alien8.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
> Ooh, now I see it - you have virtual and physical initramfs address thing=
s. We
> usually call those "va" and "pa". So
>
> initramfs_{va,pa}_{start,end}

Okay, I will call external_initramfs_{va,pa}_{start,end}
(after I will remove initrd, which will happen after a year)

"external" means "bootloader-supplied" as opposed to builtin initramfs.

--=20
Askar Safin

