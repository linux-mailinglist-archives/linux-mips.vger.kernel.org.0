Return-Path: <linux-mips+bounces-4667-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC4945A33
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 10:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580561F2291C
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 08:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1FA140366;
	Fri,  2 Aug 2024 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5mgQ7rJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D9482DD;
	Fri,  2 Aug 2024 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722588330; cv=none; b=th9be6r7bYSXCGqqaJFjZKQDcfH2quZlgCfDZkGarEv9i/fNR9U6jrT0DT/BPd8zRHgHp0wQVIMPpqlWrAI+eOsXXl1QPgguU2nWRCkKeQAl2ZAVWeJHdx7pLtXrZvq6hyqg+mOlU3UU2SSZF4k6zrm28sDozdniwb0mmh11+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722588330; c=relaxed/simple;
	bh=MbPYYR0/FZQoAhYSquy2Ma1/LDExEsEhgTxoq1fDnSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7yzHzSGqRKGMjLuHIdjMo7OEODXoaJHNAyrvgW0geDFbVNyJtPOhppbAplwQL+Jru0OHbrWMw2lyQigDO1zzv4YuypiGOzJVrOGMvqj8JGR4K2PzcTaVKMyJl3EHCX16MHjDHm+9nPA3YEav+ggj0tkzsb5HY8+0LlW/lhdLVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5mgQ7rJ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ed9b802ceso9565253e87.3;
        Fri, 02 Aug 2024 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722588327; x=1723193127; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvS7TVQvpuiYqxc/S/U1zazVjoL/w8UUJxKcIvFYQN4=;
        b=j5mgQ7rJQMnbqaMjBoYEOXV4JjhACMe3nqWCBw/p5+wtR3QuW5TukERgxix7tf2xAs
         //pDsnVkJ7kik+xe2NuFsWH1RV/kX9X9tAM8MPbe6CUBBiBbhDs26drkS29TYSh+IdsB
         jQhZH9AaF/uVrfBx5RnpJti79BLub9bDrl1ndKRghGitevtlbtkGKaSnbNmCnJxyVKnj
         jKiVTjfT/b+8k4WeH5UsOR2SHj5TkBWyE54MRW2m3xZn6XXZmfA2mUdvfQ0LWHawHsk3
         Jcz0wlSJnGsM68ts7bIdPeuI/2jpTkFu3NffSJdpKAG3bi4fobUiRF3EL4sprfuiIyl/
         2Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722588327; x=1723193127;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvS7TVQvpuiYqxc/S/U1zazVjoL/w8UUJxKcIvFYQN4=;
        b=ZFbk01pc0I2A598N94reqi3vY2Kv/2dPatjy+SwWQovm2vHF1v6l1fExP9YaHuu2uO
         EqlF8Y3refu2f6se5v5fy8lYE0hL8LyicfXJZpwQ6dIP6H2JJF60n4IkhbMw0xvZ+A0U
         eBvj+9kThI2knX4XfdW2slLJ401uEstfhhDLHkJfsN2hNYptemPRUD8E9yUwjiujamps
         v9r17rXpONXQI8QHJn3+3fgV9lESZjyBn4Ri5/Cvzk7cUAcFuoHAgYwq5OBpis3/UHqf
         LxqQ6t3Ql18/SiwetRnjhvCWFdwFsEe79VKZQigbSZOthlHRNUwWb5i/GzLJ8lSZNfAW
         xVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0BtlHX1QMRS6H/buNK0ZVEZSh4p+3SaqsI3YqDoyncb1Sv13u37049SC5GnR++fxDkYTDXnoAkvrQJNpfSXJVfPIGLuc6N9mp+yGBrKtUTuGki9Vhb1ro0Bnq3Rk1BzeSQWAIpPFpUA==
X-Gm-Message-State: AOJu0YzjZ5LoAb9Bm0O/6+c6ellGJfFOSnurQrl0xHOUGRZkE6c/gQiU
	vSIxODSAYP3b+K0FrRg8qCB4ZsedVx0hZ7+K6WzYaFJrQy79bUxI
X-Google-Smtp-Source: AGHT+IFUvyCGgECIil7G9bwoQUO5XPl20qZnHReZ1Q7rivOL/6xyhVspikHQDut4gEkm7NRcQfmCyw==
X-Received: by 2002:ac2:4e07:0:b0:530:ac41:4bf with SMTP id 2adb3069b0e04-530bb3b42ccmr1602396e87.61.1722588326742;
        Fri, 02 Aug 2024 01:45:26 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba10dedsm170889e87.79.2024.08.02.01.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 01:45:26 -0700 (PDT)
Date: Fri, 2 Aug 2024 11:45:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [RFC] MIPS: smp: Sleeping func called from start_secondary()
Message-ID: <6szkkqxpsw26zajwysdrwplpjvhl5abpnmxgu2xuj3dkzjnvsf@4daqrz4mf44k>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

To debug some another problem I recently enabled the
CONFIG_DEBUG_ATOMIC_SLEEP config for my SoC based on the 2xP5600 cores
with MIPS GIC as IRQ-controller. That caused the next BUG backtrace
started being printed to the system log during the device boot-up:

[    0.118053] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:283
[    0.118062] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
[    0.118069] preempt_count: 1, expected: 0
[    0.118074] RCU nest depth: 0, expected: 0
[    0.118078] Preemption disabled at:
[    0.118082] [<80105040>] arch_dup_task_struct+0x20/0x118
[    0.118116] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.11.0-rc1-bt1-00312-gca6f9469050c-dirty #2460
[    0.118134] Stack : 816d0000 801b89bc 81870000 00000004 a02d0c08 00000000 84ae7dcc 801b84c0
[    0.118167]         00000000 00000002 00000000 00000000 00000000 00000001 84ae7d70 84aaf200
[    0.118195]         00000000 00000000 81115acc 00000000 00000059 84ae7bec 00000000 00000000
[    0.118222]         00000000 ffffffff ffffffea 00000020 816d0000 00000000 81115acc 00000002
[    0.118250]         00000000 04240021 a02d0c08 00000000 00000000 00000000 30400000 ac24242a
[    0.118277]         ...
[    0.118286] Call Trace:
[    0.118289] [<8010af2c>] show_stack+0x88/0x120
[    0.118309] [<80f09dfc>] dump_stack_lvl+0x78/0xb0
[    0.118323] [<801778d0>] __might_resched+0x190/0x1f0
[    0.118349] [<80f10f80>] mutex_lock+0x20/0x74
[    0.118365] [<801c8590>] irq_create_mapping_affinity+0x48/0x104
[    0.118390] [<801121ec>] r4k_clockevent_init+0x58/0x38c
[    0.118402] [<80116658>] start_secondary+0x34/0x134
[    0.118411] [<80f0b1e4>] smp_bootstrap+0x68/0x98
[    0.118424] 

I managed to investigate the problem a bit and the reason turned out to be
in the irq_create_mapping() method eventually invoked in the framework of the
secondary CPU start-up procedure. The more detailed calls chain is:
start_secondary()
+-> mips_clockevent_init()
    +-> r4k_clockevent_init()
        +-> get_c0_compare_int()
            +-> gic_get_c0_compare_int()
                +-> irq_create_mapping()
                    +-> irq_create_mapping_affinity()
                        +-> mutex_lock()
                            +-> might_sleep()
                                +-> might_resched()
                                    +-> __might_resched()
                                        +-> Print the log above

I currently lack of free time for further investigation in an attempt to
find a reasonable solution. So here is just a report and a short summary
of the problem. Should you have any idea of how to fix the problem I'll be
very glad to test it out on a short notice.

-Serge(y)

