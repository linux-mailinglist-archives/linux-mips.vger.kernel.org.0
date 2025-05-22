Return-Path: <linux-mips+bounces-9066-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6CAC0584
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 09:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9081BA72C0
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 07:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CD91E32A3;
	Thu, 22 May 2025 07:21:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B91A3A80;
	Thu, 22 May 2025 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898494; cv=none; b=tJqL4bJVfRvsYPmYwbCsca5QHK0WtwtzZbEk6Vmu34GC/Dms8ebK7kn3TqtAjPkLfY4/uHxTlhofLwm3jOL/JTbxYoQeH+O+a4DERXTNPj66NdDSYxAl+PaxCyNjoGF5RHGijPYJ5KolNvTqPa8XRFpoKx/NK4m8vQpUPc+ELCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898494; c=relaxed/simple;
	bh=PimKZV/vvpya6qk4QcsOlAInmmFkcQUXGB3xQOYFJ9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQQtAdR2RAJ6bEIBEw62gdfPtiI55V8pBxBeN7ouYe+K3VQ4IBnsh74sqMCZgj4QwnyumjDNp4dVcNWYO+VijYVPApQjQdWV52GGYbjn0thiwThCRypAvEirrDYfB8wo+M1GoQUN64Tir0sbIDhMvY5OcLzbYB642jZ8eiiTRXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e1382f2b24so4333716137.1;
        Thu, 22 May 2025 00:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898489; x=1748503289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pm7W9V2mmyzuHBQiDodlGveixXiKksfY8Pj8Y9T4Ts=;
        b=OI9Gd3MvmSjf5JtkWqTyMnbEGYY+DdbaIB64nSKULLLk5SOoS4QcIn0XgsCtFV+zdZ
         yTg0qJWs67B212dEfsMKVySPBYPMxLX38u9QD5mC5h9wRM7aqfjhG4LtXQWndHGzGa+g
         wVczdMV1v+4bc+IunFrIeQiruzos/Do+deGbkM8PxMER5FnIOSpKQJ4M7EVasaGUip/+
         wxkgb354WevV50Rvz8rpFpW0RhNXN0Knx4/BzRM8zxMNaX5yZ/gP3KqaUHMaq15IyJWx
         kkSlY/OnvRULoAD1A+WhkSTpbaBFP8caLTF/eicrjWHcIE2sgt6j+D6666zYR7ZukqLQ
         xQuw==
X-Forwarded-Encrypted: i=1; AJvYcCUieKsWWZ4L3np1e1S/khVjBaKEMgSFJWYaOuYEZ3ywvf1YK+ErobiaW3dYmg93K24+uPPL+aBDdEpjKg==@vger.kernel.org, AJvYcCVtjxUeCe5v/zKw9RjdvLmClTJ2RHuvK1emrJKIliartVsTZ6Pxo1XSf5a1XsqH5JlN+BJhxa4LY0rvmake@vger.kernel.org, AJvYcCWDvZAI91E+c5dZukNWrt4N/R3XmsDcaZUc+YsfVYCc7yiYL3r7KuLnMIk3RZiQ9VP5bp6FxYjHXdJeQA==@vger.kernel.org, AJvYcCWE7hLDEBN59ohyiRbZV95NL9pL8qtoZz6ZOd6jf8ogVtyILQXUBIVWAc1/zYnXlesf31v3VWk7/PJ85w==@vger.kernel.org, AJvYcCWbHq7SJf8oC2SqzDy70LTzNSRz9Y/PX2ghhd3LdOrv5ifZ9QdBP5wqAfYrZzTz1rgRRa2LcCfM3IOdNcht@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+cLJL5t02nqiI2cmKRUUCTjzg8jmcDyINapwliBFu7lk00ieD
	vgw0pHYLk2iG9I6RUyAqIJ3UEe7deWfCDVo9V2gz7+evWxrMWv2jjqySs7YasLUo
X-Gm-Gg: ASbGncscwhKINlYHr2EVljtXTauxWSFFHJsAMYBMH6fAyiuydAWelQeF5R73tzzcDOE
	STHDPTqRKuYarH9yzbTpZje0yKlnk4xldF9J7Z/GrO79F90++V4POcj6AtRT5FMvdduX3XMyZ6E
	YBB4yWWGz66tKKZaYU3Ct+49Nico7dZQnTSgGpJfa70KFFVW2aFsdaNvBd3pviAMmDAtrp/RYdg
	oFbltgSz2W364oeebPrpRltbWv55/gmerbpYzVXVfuh3SZlWU730ZRU8YxYhuardMrok6nAsPFS
	URzyR5cPdIIEcJFm9oRSzK05A69H7cSr5pTOCWTpx7ICzQz/9DtVrDdr3G6p2Xp/yjNNx87oxnJ
	HBovBW4RYzd0OcA==
X-Google-Smtp-Source: AGHT+IGe9hmMMlui2/8ywXvpwEV0kAauzMYRasYjY7VGENvtBGXDOj9IiPeWqWSQqJjzZ2gaDWjQzQ==
X-Received: by 2002:a05:6102:15a2:b0:4df:9e8b:8cad with SMTP id ada2fe7eead31-4dfa6c1dc1emr23187816137.22.1747898489103;
        Thu, 22 May 2025 00:21:29 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa66bf405sm10947499137.9.2025.05.22.00.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:21:26 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e150f1ba9aso3933424137.2;
        Thu, 22 May 2025 00:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJrYVQ/yyjR7RpXuEHQzBmXHI6g5DMr63zzidJQjaHseMbUm90rJeP/dwbrGlVK3bt/GCLveDwprUldQ==@vger.kernel.org, AJvYcCV0N0dRZSr2pWmxyh2tf7rGUCnCtS25ZfBRWu4QIId1h754Pnm9/ky2ZEgqcK0EQLO0F+Jq9wvKGEITwl57@vger.kernel.org, AJvYcCV1FHon2dnh/AwJY2IvZH5dZd9SObIGAoK7JdNaTEvlIEfGVgnXdpfCqphcegUoJrgfyAv7Xizop0wtew==@vger.kernel.org, AJvYcCVOi/wruGQLx+xQQbMhX9UYEM8InCnhvLxrkpdJUIyTf6Zh9dOXpSom5ijWCB0emfrBkiFw902FE8TkK8y0@vger.kernel.org, AJvYcCXBfgBP9NKQ6jy9ymsoizwrxm68/pjkSr7urVLyl6Ujgaypz20axdRecYPHVIRYiKiZOldoDGBS+Xy3GA==@vger.kernel.org
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id
 ada2fe7eead31-4dfa6b586f8mr25153206137.9.1747898486254; Thu, 22 May 2025
 00:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 09:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
X-Gm-Features: AX0GCFsqKFm6qJMA3hsMqbJWzZuzklg0ynX2aADj_Q8qeZ9nB2XXIFQN5G6rIkM
Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/ code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for your patch!

On Wed, 21 May 2025 at 19:42, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Since the commit 3d86739c6343 ("floppy: always use the track buffer")
> the CROSS_64K() is not used by the driver, remove the leftovers.

"CROSS_64KB" (also in the subject; "git grep" found no users at all ;-)

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

