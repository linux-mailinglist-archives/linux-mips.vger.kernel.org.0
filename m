Return-Path: <linux-mips+bounces-8222-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46CA688B6
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 10:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9813B1386
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 09:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8D72566F8;
	Wed, 19 Mar 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9FgvpHG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4E9253350;
	Wed, 19 Mar 2025 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377441; cv=none; b=QwsvB8eTX1ruiIh3Sftb2hZMW5kPlS1XKhE7ygrr8AXDsmeypkBWc+7q/6v4sMj0HAhLHsZa0TRvXjRuisbJgp2eQu3EprbG61R8OecCSD2CRXum4oWivw1aiyznNDfigmUrzVLJ0yjlv6KD3uSWuEZiz55jn+mzIgAbkNL5vsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377441; c=relaxed/simple;
	bh=o0JSgSIRO0I3Q8fHY58JYYQWbqcXN7AzM4/dfsLS+VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuBlzwQqqFIjCgwOggep87WhvCgfPkVEY3wQHF4L2u+Zg2tQQOcaYL62JxJ/mZczuEd76T6zbE5l1Jjrv73Nx+f0mnqJ96N40isJRBpmUkxitE5/afzDBjekkc0z288hW1BY0/i9hU+eNvk2XWzMnah7oDzfoG2WlHOPj9XU5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9FgvpHG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3014ae35534so5515277a91.0;
        Wed, 19 Mar 2025 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742377438; x=1742982238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUnMLMfJ+o5pUPBtrZYyIcUNmnugM6cy8+lj2brxdIA=;
        b=J9FgvpHGl9B53Tow+gx096Hz+uPZ87alcUhn2ZaqdN+fRcEX8cErFi0oQz+9WZ1Pf1
         Btsia9Qy3HCko0XA0ht1B83JrdFVL4rOtqhOmmquOKX68OVlENLgxuckJVUmuY5T2ZfE
         DUD6AP37fXK5j9iVPI4bDj6iekcW6p6fChs2SO3Ao4DHqLcpC299+9EWJdz7wZXaCbHU
         5N+LQMrqFf7oyDaoDyjsdPGk+HQrGUw1i/Pirt9Inj246w5FMfHTaDm3kRnXaBWa746X
         4P9LMae3RBMg9orrsVaJp1C1wXdWQ0ljSzsEv3WfIQvkpMsjn5d9oKNGkk2MCFXn2Chr
         BLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377438; x=1742982238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUnMLMfJ+o5pUPBtrZYyIcUNmnugM6cy8+lj2brxdIA=;
        b=aBdIEuyPhlo/vOnLxGq7O0Y3+iXzasqQp1N8jKR1Q98+pPux3qHSVw9SSY4XSnR/+A
         pcuXTEHnvEF8moGQCyJOQW5q3swSg02/C78sZBYtnK1CTPdNAe4+kZT2XSMpX1Q0RbAU
         5/7KvKXYiYC4NB9POvjo1NAlAEYe/KYDeRjSkmMh4Y5lrsk4CrnMkCv2u7ZNEoiNKgMu
         XaFY5xEpUu/DQC3AtILsSodHvDNwOYYuV+efvp2TW5g8KQjYL7M4Lr25DApi3Yhwf0M6
         i+sZiOGLMtGzSCNb6EWXjJfCe9I5gnP0mELhOhIFmZWylDrLUOZnDaIGbl+WcnvnajKi
         icHg==
X-Forwarded-Encrypted: i=1; AJvYcCVGIETDzXDU7gZJuEFe5Nqw4l5M0/JoqtRRXkDcPqaLt2Vllwn6NItAlFZDxfhAXlVre8jI//9j9GcErA==@vger.kernel.org, AJvYcCVJ+5jgTZ30R2irvYa6LrDug1Mfgli7S5s3RjEqRZjhISy+GZnCUBEWkV17bOZU+9D8GSrW/xYivAbQtfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww92zI+7wfrCEPmVOgPSbN95qSs8NAr/DoztgBo7nllm01utTa
	PJJiDovW2kfHWxhhDdiaT/7LPU17VZcuPhTM+4+6yUSK/l/hyAxfX1ohushLbi3V+BqyxVvf8j4
	+NOAUzmvvqwZigMO/ZH5HGupqp1U=
X-Gm-Gg: ASbGnctCEZz/5/8FOQwTVB3na+5Yuib5wz6Zj+19d5Z9iB+l92FIO9QbPn1Egx4dWWg
	7uMzVKWWYhzE0OCiQ2N6nYQZvsIvgMev37vkJFWGe1sB3hmJfrF9RAUE9fJjyUFOwPbLmbKnaY1
	WLk+7N3XOquWPoJ7BYleXHbFdR
X-Google-Smtp-Source: AGHT+IGs2SPC6I76SvPHB3/U0b1m2TiUYh0m4XuUxe+O06eGDzjIFE5x9/WEkg2wsTCB/l7UhYR7aqO9BLm0gXyvdGY=
X-Received: by 2002:a17:90b:4a10:b0:301:a0e9:66f with SMTP id
 98e67ed59e1d1-301bde6e7c5mr3279303a91.14.1742377438047; Wed, 19 Mar 2025
 02:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318214406.874733-1-arnd@kernel.org>
In-Reply-To: <20250318214406.874733-1-arnd@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 19 Mar 2025 10:43:46 +0100
X-Gm-Features: AQ5f1Jp0-Xaf1ONbTo1tRsYqFOR2ZfNNix4OjgkPbzdmtYS-y8kgUeQyWO3Knso
Message-ID: <CAMhs-H_3WTMvd0kitT6Bp3a5ijjwhwEYhWbFTQ2uUQpmis12cQ@mail.gmail.com>
Subject: Re: [PATCH] mips: fix PCI_IOBASE definition
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, Mar 18, 2025 at 10:44=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> After my previous patch, the ioport_map() function changed from
> the lib/iomap.c version to the asm-generic/io.h version, which
> requires a correct PCI_IOBASE definition.
>
> Unfortunately the types are also different, so add the correct
> definition for ioport_map() in asm/io.h and change the machine
> specific ones to have the correct type.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is not pretty, but it seems to address the remaining problems.
> I've applied it on top of my cross-architecture io.h cleanup that
> has the other mips patch.
>
> Let me know if there are still any other concerns.
>
>
>  arch/mips/include/asm/io.h                     | 6 +++++-
>  arch/mips/include/asm/mach-loongson64/spaces.h | 5 +++--
>  arch/mips/include/asm/mach-ralink/spaces.h     | 2 +-
>  arch/mips/loongson64/init.c                    | 4 ++--
>  4 files changed, 11 insertions(+), 6 deletions(-)

I have built and booted an image from your git tree 'master' branch on
GNUBee PC2 board which is a MIPS mt7621 ralink based SoC:

commit ac4e3b09c90480e17939f432da37a5328bad76ab (HEAD,
arndtree/master, arndtree/asm-generic)
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Mar 18 22:15:35 2025 +0100

    mips: fix PCI_IOBASE definition

    After my previous patch, the ioport_map() function changed from
    the lib/iomap.c version to the asm-generic/io.h version, which
    requires a correct PCI_IOBASE definition.

    Unfortunately the types are also different, so add the correct
    definition for ioport_map() in asm/io.h and change the machine
    specific ones to have the correct type.

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

It looks like nothing got broken regarding PCI enumeration on boot
trace. I don't have real PCI cards with IO resources to test, but FWIW
the enumeration is the same as from my stable 6.12 kernel boot.

For completeness:

[    0.000000] Linux version 6.14.0-rc1+ (sergio@camaron)
(mipsel-unknown-linux-gnu-gcc (GCC) 9.4.1 20211208, GNU ld (GNU
Binutils) 2.37) #17 SMP Wed Mar 19 10:30:35 CET 2025
[    0.000000] SoC Type: MediaTek MT7621 ver:1 eco:3
[    0.000000] printk: legacy bootconsole [early0] enabled
[    0.000000] CPU0 revision is: 0001992f (MIPS 1004Kc)
[    0.000000] MIPS: machine is GnuBee GB-PC2
...
[   21.149742] mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
[   21.163163] mt7621-pci 1e140000.pcie:      MEM
0x0060000000..0x006fffffff -> 0x0060000000
[   21.179519] mt7621-pci 1e140000.pcie:       IO
0x001e160000..0x001e16ffff -> 0x0000000000
[   21.524679] mt7621-pci 1e140000.pcie: PCIE0 enabled
[   21.534290] mt7621-pci 1e140000.pcie: PCIE1 enabled
[   21.544141] mt7621-pci 1e140000.pcie: PCIE2 enabled
[   21.554040] PCI coherence region base: 0x60000000, mask/settings: 0xf000=
0002
[   21.568419] mt7621-pci 1e140000.pcie: PCI host bridge to bus 0000:00
[   21.581116] pci_bus 0000:00: root bus resource [bus 00-ff]
[   21.592079] pci_bus 0000:00: root bus resource [mem 0x60000000-0x6ffffff=
f]
[   21.605788] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[   21.618237] pci 0000:00:00.0: [0e8d:0801] type 01 class 0x060400
PCIe Root Port
[   21.632822] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x7fffffff]
[   21.644670] pci 0000:00:00.0: BAR 1 [mem 0x00000000-0x0000ffff]
[   21.656445] pci 0000:00:00.0: PCI bridge to [bus 00]
[   21.666309] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[   21.678361] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   21.691828] pci 0000:00:00.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   21.706279] pci 0000:00:00.0: supports D1
[   21.714103] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
[   21.726449] pci 0000:00:01.0: [0e8d:0801] type 01 class 0x060400
PCIe Root Port
[   21.740986] pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x7fffffff]
[   21.752680] pci 0000:00:01.0: BAR 1 [mem 0x00000000-0x0000ffff]
[   21.764437] pci 0000:00:01.0: PCI bridge to [bus 00]
[   21.774292] pci 0000:00:01.0:   bridge window [io  0x0000-0x0fff]
[   21.786381] pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   21.799858] pci 0000:00:01.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   21.814286] pci 0000:00:01.0: supports D1
[   21.822144] pci 0000:00:01.0: PME# supported from D0 D1 D3hot
[   21.834438] pci 0000:00:02.0: [0e8d:0801] type 01 class 0x060400
PCIe Root Port
[   21.849019] pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x7fffffff]
[   21.860731] pci 0000:00:02.0: BAR 1 [mem 0x00000000-0x0000ffff]
[   21.872487] pci 0000:00:02.0: PCI bridge to [bus 00]
[   21.882335] pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
[   21.894437] pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   21.907913] pci 0000:00:02.0:   bridge window [mem
0x00000000-0x000fffff pref]
[   21.922343] pci 0000:00:02.0: supports D1
[   21.930194] pci 0000:00:02.0: PME# supported from D0 D1 D3hot
[   21.943428] pci 0000:00:00.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   21.959309] pci 0000:00:01.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   21.975168] pci 0000:00:02.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[   21.991373] pci 0000:01:00.0: [1b21:0611] type 00 class 0x010185
PCIe Legacy Endpoint
[   22.006936] pci 0000:01:00.0: BAR 0 [io  0x0000-0x0007]
[   22.017235] pci 0000:01:00.0: BAR 1 [io  0x0000-0x0003]
[   22.027589] pci 0000:01:00.0: BAR 2 [io  0x0000-0x0007]
[   22.037957] pci 0000:01:00.0: BAR 3 [io  0x0000-0x0003]
[   22.048325] pci 0000:01:00.0: BAR 4 [io  0x0000-0x000f]
[   22.058693] pci 0000:01:00.0: BAR 5 [mem 0x00000000-0x000001ff]
[   22.070611] pci 0000:01:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:00.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   22.114603] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[   22.124936] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[   22.138347] pci 0000:02:00.0: [1b21:0611] type 00 class 0x010185
PCIe Legacy Endpoint
[   22.153917] pci 0000:02:00.0: BAR 0 [io  0x0000-0x0007]
[   22.164212] pci 0000:02:00.0: BAR 1 [io  0x0000-0x0003]
[   22.174587] pci 0000:02:00.0: BAR 2 [io  0x0000-0x0007]
[   22.184948] pci 0000:02:00.0: BAR 3 [io  0x0000-0x0003]
[   22.195311] pci 0000:02:00.0: BAR 4 [io  0x0000-0x000f]
[   22.205685] pci 0000:02:00.0: BAR 5 [mem 0x00000000-0x000001ff]
[   22.217590] pci 0000:02:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:01.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   22.264617] pci 0000:00:01.0: PCI bridge to [bus 02-ff]
[   22.274959] pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
[   22.288402] pci 0000:03:00.0: [1b21:0611] type 00 class 0x010185
PCIe Legacy Endpoint
[   22.303981] pci 0000:03:00.0: BAR 0 [io  0x0000-0x0007]
[   22.314270] pci 0000:03:00.0: BAR 1 [io  0x0000-0x0003]
[   22.324651] pci 0000:03:00.0: BAR 2 [io  0x0000-0x0007]
[   22.335005] pci 0000:03:00.0: BAR 3 [io  0x0000-0x0003]
[   22.345372] pci 0000:03:00.0: BAR 4 [io  0x0000-0x000f]
[   22.355745] pci 0000:03:00.0: BAR 5 [mem 0x00000000-0x000001ff]
[   22.367654] pci 0000:03:00.0: 2.000 Gb/s available PCIe bandwidth,
limited by 2.5 GT/s PCIe x1 link at 0000:00:02.0 (capable of 4.000
Gb/s with 5.0 GT/s PCIe x1 link)
[   22.414605] pci 0000:00:02.0: PCI bridge to [bus 03-ff]
[   22.424945] pci_bus 0000:03: busn_res: [bus 03-ff] end is updated to 03
[   22.438133] pci 0000:00:00.0: BAR 0 [mem size 0x80000000]: can't
assign; no space
[   22.452906] pci 0000:00:00.0: BAR 0 [mem size 0x80000000]: failed to ass=
ign
[   22.466731] pci 0000:00:01.0: BAR 0 [mem size 0x80000000]: can't
assign; no space
[   22.481599] pci 0000:00:01.0: BAR 0 [mem size 0x80000000]: failed to ass=
ign
[   22.495413] pci 0000:00:02.0: BAR 0 [mem size 0x80000000]: can't
assign; no space
[   22.510272] pci 0000:00:02.0: BAR 0 [mem size 0x80000000]: failed to ass=
ign
[   22.524106] pci 0000:00:00.0: bridge window [mem
0x60000000-0x600fffff]: assigned
[   22.538973] pci 0000:00:00.0: bridge window [mem
0x60100000-0x601fffff pref]: assigned
[   22.554690] pci 0000:00:01.0: bridge window [mem
0x60200000-0x602fffff]: assigned
[   22.569548] pci 0000:00:01.0: bridge window [mem
0x60300000-0x603fffff pref]: assigned
[   22.585270] pci 0000:00:02.0: bridge window [mem
0x60400000-0x604fffff]: assigned
[   22.600145] pci 0000:00:02.0: bridge window [mem
0x60500000-0x605fffff pref]: assigned
[   22.615856] pci 0000:00:00.0: BAR 1 [mem 0x60600000-0x6060ffff]: assigne=
d
[   22.629342] pci 0000:00:01.0: BAR 1 [mem 0x60610000-0x6061ffff]: assigne=
d
[   22.642816] pci 0000:00:02.0: BAR 1 [mem 0x60620000-0x6062ffff]: assigne=
d
[   22.656306] pci 0000:00:00.0: bridge window [io  0x0000-0x0fff]: assigne=
d
[   22.669776] pci 0000:00:01.0: bridge window [io  0x1000-0x1fff]: assigne=
d
[   22.683249] pci 0000:00:02.0: bridge window [io  0x2000-0x2fff]: assigne=
d
[   22.696739] pci 0000:01:00.0: BAR 5 [mem 0x60000000-0x600001ff]: assigne=
d
[   22.710216] pci 0000:01:00.0: BAR 4 [io  0x0000-0x000f]: assigned
[   22.722313] pci 0000:01:00.0: BAR 0 [io  0x0010-0x0017]: assigned
[   22.734402] pci 0000:01:00.0: BAR 2 [io  0x0018-0x001f]: assigned
[   22.746496] pci 0000:01:00.0: BAR 1 [io  0x0020-0x0023]: assigned
[   22.758594] pci 0000:01:00.0: BAR 3 [io  0x0024-0x0027]: assigned
[   22.770695] pci 0000:00:00.0: PCI bridge to [bus 01]
[   22.780547] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[   22.792631] pci 0000:00:00.0:   bridge window [mem 0x60000000-0x600fffff=
]
[   22.806106] pci 0000:00:00.0:   bridge window [mem
0x60100000-0x601fffff pref]
[   22.820461] pci 0000:02:00.0: BAR 5 [mem 0x60200000-0x602001ff]: assigne=
d
[   22.833940] pci 0000:02:00.0: BAR 4 [io  0x1000-0x100f]: assigned
[   22.846037] pci 0000:02:00.0: BAR 0 [io  0x1010-0x1017]: assigned
[   22.858127] pci 0000:02:00.0: BAR 2 [io  0x1018-0x101f]: assigned
[   22.870223] pci 0000:02:00.0: BAR 1 [io  0x1020-0x1023]: assigned
[   22.882319] pci 0000:02:00.0: BAR 3 [io  0x1024-0x1027]: assigned
[   22.894423] pci 0000:00:01.0: PCI bridge to [bus 02]
[   22.904263] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
[   22.916359] pci 0000:00:01.0:   bridge window [mem 0x60200000-0x602fffff=
]
[   22.929833] pci 0000:00:01.0:   bridge window [mem
0x60300000-0x603fffff pref]
[   22.944185] pci 0000:03:00.0: BAR 5 [mem 0x60400000-0x604001ff]: assigne=
d
[   22.957663] pci 0000:03:00.0: BAR 4 [io  0x2000-0x200f]: assigned
[   22.969756] pci 0000:03:00.0: BAR 0 [io  0x2010-0x2017]: assigned
[   22.981859] pci 0000:03:00.0: BAR 2 [io  0x2018-0x201f]: assigned
[   22.993949] pci 0000:03:00.0: BAR 1 [io  0x2020-0x2023]: assigned
[   23.006046] pci 0000:03:00.0: BAR 3 [io  0x2024-0x2027]: assigned
[   23.018150] pci 0000:00:02.0: PCI bridge to [bus 03]
[   23.027983] pci 0000:00:02.0:   bridge window [io  0x2000-0x2fff]
[   23.040087] pci 0000:00:02.0:   bridge window [mem 0x60400000-0x604fffff=
]
[   23.053557] pci 0000:00:02.0:   bridge window [mem
0x60500000-0x605fffff pref]
[   23.067900] pci_bus 0000:00: Some PCI device resources are
unassigned, try booting with pci=3Drealloc
[   23.085874] pci_bus 0000:00: resource 4 [mem 0x60000000-0x6fffffff]
[   23.098318] pci_bus 0000:00: resource 5 [io  0x0000-0xffff]
[   23.109370] pci_bus 0000:01: resource 0 [io  0x0000-0x0fff]
[   23.120434] pci_bus 0000:01: resource 1 [mem 0x60000000-0x600fffff]
[   23.132870] pci_bus 0000:01: resource 2 [mem 0x60100000-0x601fffff pref]
[   23.146184] pci_bus 0000:02: resource 0 [io  0x1000-0x1fff]
[   23.157242] pci_bus 0000:02: resource 1 [mem 0x60200000-0x602fffff]
[   23.169680] pci_bus 0000:02: resource 2 [mem 0x60300000-0x603fffff pref]
[   23.182983] pci_bus 0000:03: resource 0 [io  0x2000-0x2fff]
[   23.194041] pci_bus 0000:03: resource 1 [mem 0x60400000-0x604fffff]
[   23.206488] pci_bus 0000:03: resource 2 [mem 0x60500000-0x605fffff pref]
...

So, feel free to add my:

Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com> # Mt7621 Ralin=
k

Let me know if you want me to check anything else.

Best regards,
    Sergio Paracuellos

