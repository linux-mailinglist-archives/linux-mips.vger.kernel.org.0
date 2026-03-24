Return-Path: <linux-mips+bounces-13919-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LDVI8PIwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13919-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:24:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B59EF319F42
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E451330274A4
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160CE3D75DE;
	Tue, 24 Mar 2026 17:12:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69ED23EAB4
	for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2026 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372338; cv=none; b=WGe4tRson0OiW7Bay7RU3a3UnQtKH+xBGZBh/8ApyAawCdPAo0fiGDVRHnE0Ie1gbd1YCqISbnwi1rhm00ZLsELxuUoItmKekSPRS6YYSPCZ5nTkxIpQIJ9zJGFGqCLVevTuVQiFUBEgeaBWso7JnkoKJJf2BZOjFch16EBzjXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372338; c=relaxed/simple;
	bh=3GEJwPfpmz1HAcFqPqDcCHr7DP7fs2OA9k1TBgcroIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwLYlyQ46pvMgNVqBU2pwjG5fvw4nT+wEliM2a4EVKfyhhX9l8V1C0Td8Uvh9eCsLqK4Qpg58akSkzNb017xpDbwkMBCSegOf/i8+SZzfvimxDVq54T2viACPTMkiiRNLzZvOyAWYJy8+xqBOQ/akQwNoTs6kNNOZFgEh11Oevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so3338529a91.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2026 10:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372336; x=1774977136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imA4hBFgRxEV6K6PxesH3aFI8Gk9es7sFYCGiASF9lc=;
        b=A6hhjBHAxxbOWJoOWp+FvqZhGTEmZI/AftLpYuTdD9ASLDdkNEWxLSqJqr/vGq3Jxq
         ILDWyGKYNgM9z4X/By0EQGOOisXo8Av8Pa0XLw5g9Y8Yg3CS+WleIICbXo0c5SdJEEhd
         jNyQ0c+agrL+V/aCvyBckhI3TCk6eb1Nj/mrY3OeCTgmlbRtQ8lhvkaRIJHthA1yXQI+
         SvdDIoBGHjT+MK/8y3ncEBb6CDA4lSkgIqHt30z2rsLZXf3oDXEnU0tRyfQPwYpH8Efo
         kPzQLVeABcjunBmLRsPQesZmC8gkLLJk496zFPKynd5RKyuEdAcOrJoKxlT68YXEvzXw
         oHKA==
X-Forwarded-Encrypted: i=1; AJvYcCXXWwtU3Zg4XrzULod2HNssuHwWB1dKisZQDlZpKh8ypB4O8L5QrYxRRGnUn+xUa0Ud/KKVghFGhTdW@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGk+5LrzJ+FKhg3aaA6HSaMt1bZ4qKYOLJnSGL5LxO+D/yAR3
	fRHkavnsWghjC+hPlZeUfisUDxgPL67PaEL9ZeWaE0S9wipCHKSgspY/NtH8ltgkphg=
X-Gm-Gg: ATEYQzw60SDaZvh1VkVDTXtR1R5htvfwUU5duHa4Imo94lhFwSIcx+w6eU28Vb1eau0
	TgYhLr5KXrjGrZfoCLYw6MkOIkLMnqAqIe90G/lhsprIqpJ9T16Ov2DjoSPHvG1IYEJ/0zKYl4E
	uG8G72EgBIZ5KfexDL6GjP/dengyY2v0Sn8WZaKAhBA6+CvdoplWRzOaOMWh4V1X1AtsqFtodmk
	otCVtEIeI8kvikruibvhAzND0m6LZd5J6MZ0RNw83ENCoUakvp17T7jldpN1xF2ZqjQd7uw3AnS
	Imc44bKN9NPeIjjgHDfZemgG8+e+cByc9N3cqV2kZlbA9B2aQq9p9qWbP/EcmMW0MW47tDYQThk
	n3HtwgJ5lgBaw/EvhowMOumwi38sn9kH+Te++z4nrHxsr5u9pz4Q6AvoAvF+0LYzacmb7l5DO/h
	qq5IUn/c37M1CDCj+yrf0cxMNbhTiYlYiKfKyBmdClN+r+yNAyH29EGtD+xwAfdnU=
X-Received: by 2002:a17:90b:3f45:b0:35b:96bb:47b5 with SMTP id 98e67ed59e1d1-35c0dcdc453mr129817a91.15.1774372335981;
        Tue, 24 Mar 2026 10:12:15 -0700 (PDT)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124aaesm2692648a91.1.2026.03.24.10.12.15
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:12:15 -0700 (PDT)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0c955a481so5999506eec.1
        for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2026 10:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnRMTk47+EIyQhhwtN7Si7VyFLUSJDee9BD8lqDhGkruaHuqrTXQmzirwPctZc3nB1eiRJHBYLPxpi@vger.kernel.org
X-Received: by 2002:a05:6122:1da4:b0:56b:5978:22f5 with SMTP id
 71dfb90a1353d-56d220a8b85mr416671e0c.12.1774371994638; Tue, 24 Mar 2026
 10:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 18:06:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
X-Gm-Features: AQROBzA3vydAXwvxX7mNaSzU55R-3eBg9lznDuFtNbFYtRdYd66gsLQKONTytjo
Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,alpha.franken.de,hansenpartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-13919-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B59EF319F42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CC gerg

On Tue, 24 Mar 2026 at 17:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
>
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
>
> Thus, remove the duplicated aligning from pcibios_align_resource().
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/m68k/kernel/pcibios.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, cons=
t struct resource *res,
>         if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>                 start =3D (start + 0x3ff) & ~0x3ff;
>
> -       start =3D (start + align - 1) & ~(align - 1);
> -
>         return start;
>  }
>
> --
> 2.39.5

