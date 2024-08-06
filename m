Return-Path: <linux-mips+bounces-4733-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75327948835
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 06:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 984981C21E8E
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 04:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCCF1B9B54;
	Tue,  6 Aug 2024 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdPEdUlc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A0213BC11;
	Tue,  6 Aug 2024 04:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722917352; cv=none; b=LBzKhsL+R4hEYG8ZbBVrlOtQwILdbF1NEEnY8lIvCQkGtx+qm/TE9w/xZCEj6muBR2L1ccpDgeGsvNHAh7dByzGYacS5Ebt3wltpWvKzpy1A3CGY/zqWbkuaSSMkZs3liiBsHOq0MarGEgPMan0ngqXAuKyP/DEULO6hI0aKVc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722917352; c=relaxed/simple;
	bh=8l9WnyWHzi8Tzt2NAJoVsNu9wvQFDPty8PnCSIbrSrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG8RFD8KletzA9eYXBGRav5WlZmYfQ7bhnWMdEaiG4fnqLGYylFnVdAkyBrvWoKStKInWhsGcJ5SrUtmI4L4KzwoEZfd3o4jsdOXXBVNeBjEz/TbaUxHDzkWoLSh8G7AklOfVLxmrFtnCNzJsL222CiWFjqLECPgebveUCOawCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdPEdUlc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc56fd4de1so3054745ad.0;
        Mon, 05 Aug 2024 21:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722917350; x=1723522150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4VUlslBVhfHHLrCBxi8o+FcHDhYgsZSGNYD1GG8x6Y=;
        b=YdPEdUlcWTSyOku+kWdlF1yPCr8CYE67/KQpFWJ2ZiLbSB/EW3y/7+pQW1M4r/jDhZ
         g/Wu1dcos+n1KXHw1SESFEfpuO0SgjipbMsJpMSxjwG0+lXgIcB0mOD9DlaILHcJjr7C
         iewTEVQm+U+Wls79AsKnvjXMga3/6lVwNWsJSQFQlzVFz5DHPmxXUtoixEsXLZeJ1rMh
         uqbWhexG3gI0n1ox/N6Ijh6JRgwSB1f+ltbMdiJqLyc0QuaK0pZgUGmE5CVnNnUacskn
         3Yq6yeAOQengF70xG9+1llQlkeGcbVeGsCKWWoI7oM7HkTArclu9G8KHH7eEauuFGU7G
         +X4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722917350; x=1723522150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4VUlslBVhfHHLrCBxi8o+FcHDhYgsZSGNYD1GG8x6Y=;
        b=kbt6wWsff1qGxzqeBBnf1RdDEBak8r/+HUVmsPqRpnoTYJA65Ujg1VAr2EvvoOoHaf
         wjIZXUCm/peSWMMGC9inYd1Hr5i90fqeOQqfCdSdFk5kbtFc65XTeOwGyRLcP8JRJWuH
         B/Xp+S7VDsfEnunojWVJh5xxyKHG0PYtAdUR9fpdL1xXuzFs+WojA2HEcFyCVa38nq+O
         VSBdCs5CPSbABB9ncR2Yf7s8TtTasNzrxvD+3pxL6BMod6MVQCFt30WbKWF0wq1v2h4x
         smxTH771g3+XrPZh4/f/5TVEd07rZtglZJaMXQvwow0kD8bBrF+UC4lV+S2Kjq4GKrEL
         uMNg==
X-Forwarded-Encrypted: i=1; AJvYcCXFglxtQHSjoHc+f+xS7/43hb2OjAtYwV08LmFT6GBMpCj3QDi6O2m4ZByA5BRLwMWpBYDwpApH8rwlHGjUMgMQPsyRioYaBXv02jxLwaPEyW1tVCIpbaV/65svbgbYtwMv9uR5CqGdYQ==
X-Gm-Message-State: AOJu0Yy9bjVd6yKUj4PLDXajE+9QwH13O8mtUkBsNY1Blimj1C4yeTSV
	0E3zJd4qoNv0PQlDdcWAj66GRKc46qcLM4iHZ/fWQibv66iz76WE
X-Google-Smtp-Source: AGHT+IFExs2RIs/XzdpTCp3D3iQlVgyKXYU5xoO0Dq2vz4Ya0KViBzrT/A8gGW7SM3h8jNPfJLSrfg==
X-Received: by 2002:a17:902:f641:b0:1fb:7654:4a40 with SMTP id d9443c01a7336-1ff57bc159bmr224509635ad.14.1722917349895;
        Mon, 05 Aug 2024 21:09:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f2a159sm76770955ad.3.2024.08.05.21.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 21:09:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 5 Aug 2024 21:09:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] MIPS: csrc-r4k: Apply verification clocksource
 flags
Message-ID: <fbe92f1c-3c08-4b46-9d7a-e098ac1656a8@roeck-us.net>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
 <20240612-mips-clks-v2-2-a57e6f49f3db@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-mips-clks-v2-2-a57e6f49f3db@flygoat.com>

Hi,

On Wed, Jun 12, 2024 at 09:54:29AM +0100, Jiaxun Yang wrote:
> CP0 counter suffers from various problems like SMP sync,
> behaviour on wait.
> 
> Set CLOCK_SOURCE_MUST_VERIFY and CLOCK_SOURCE_VERIFY_PERCPU,
> as what x86 did to TSC, to let kernel test it before use.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

With this patch in the mainline kernel, about one in five qemu
boot attempts with e1000 Ethernet controller fail to activate
the network interface (specifically, the dhcp client is unable to
get an IP address for the interface). Bisect log is attached below.

For reference, here is an example command line.

qemu-system-mips64 -kernel vmlinux -M malta -cpu 5KEc \
	-initrd rootfs-n32.cpio \
	-device e1000,netdev=net0 -netdev user,id=net0 \
	-vga cirrus -no-reboot -m 256 \
	--append "rdinit=/sbin/init mem=256M console=ttyS0 console=tty " \
	-nographic

Reverting this patch fixes the probem.

Thanks,
Guenter

---
# bad: [de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed] Linux 6.11-rc2
# good: [0c3836482481200ead7b416ca80c68a29cfdaabd] Linux 6.10
git bisect start 'HEAD' 'v6.10'
# good: [280e36f0d5b997173d014c07484c03a7f7750668] nsfs: use cleanup guard
git bisect good 280e36f0d5b997173d014c07484c03a7f7750668
# good: [a4f9285520584977127946a22eab2adfbc87d1bf] Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
git bisect good a4f9285520584977127946a22eab2adfbc87d1bf
# bad: [8e313211f7d46d42b6aa7601b972fe89dcc4a076] Merge tag 'pinctrl-v6.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
git bisect bad 8e313211f7d46d42b6aa7601b972fe89dcc4a076
# good: [acc5965b9ff8a1889f5b51466562896d59c6e1b9] Merge tag 'char-misc-6.11-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good acc5965b9ff8a1889f5b51466562896d59c6e1b9
# bad: [d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d] Merge tag 'mips_6.11' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
git bisect bad d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d
# good: [45659274e60864f9acabba844468e405362bdc8c] Merge branch 'pci/misc'
git bisect good 45659274e60864f9acabba844468e405362bdc8c
# good: [8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74] Merge tag 'input-for-v6.11-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
git bisect good 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74
# good: [3c3ff7be9729959699eb6cbc7fd7303566d74069] Merge tag 'powerpc-6.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect good 3c3ff7be9729959699eb6cbc7fd7303566d74069
# good: [3de96d810ffd712b7ad2bd764c1390fac2436551] dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
git bisect good 3de96d810ffd712b7ad2bd764c1390fac2436551
# bad: [9c7a86c935074525f24cc20e78a7d5150e4600e3] MIPS: lantiq: improve USB initialization
git bisect bad 9c7a86c935074525f24cc20e78a7d5150e4600e3
# bad: [580724fce27f2b71b3e4d58bbe6d83b671929b33] MIPS: sync-r4k: Rework based on x86 tsc_sync
git bisect bad 580724fce27f2b71b3e4d58bbe6d83b671929b33
# good: [c171186c177970d3ec22dd814f2693f1f7fc1e7d] MIPS: csrc-r4k: Refine rating computation
git bisect good c171186c177970d3ec22dd814f2693f1f7fc1e7d
# bad: [426fa8e4fe7bb914b5977cbce453a9926bf5b2e6] MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
git bisect bad 426fa8e4fe7bb914b5977cbce453a9926bf5b2e6
# bad: [7190401fc56fb5f02ee3d04476778ab000bbaf32] MIPS: csrc-r4k: Apply verification clocksource flags
git bisect bad 7190401fc56fb5f02ee3d04476778ab000bbaf32
# first bad commit: [7190401fc56fb5f02ee3d04476778ab000bbaf32] MIPS: csrc-r4k: Apply verification clocksource flags

