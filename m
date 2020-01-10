Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12AB11376F0
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 20:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgAJTZP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 14:25:15 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44479 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbgAJTZO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jan 2020 14:25:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id 195so1574882pfw.11;
        Fri, 10 Jan 2020 11:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=CwWzReoSSk5ESHhKBIGbXWZbxXt19MESesFg3ACLomA=;
        b=AV/pxW5U8lVdgl93A1OWM4YUna57C0Hfgn7bjFu7xPy/K3agPp0XL+X6VXyDOz2gYw
         QMlp3+Tp1ui/loF/WsXZ7GQ6aVFzSj0g3TW/arMKok7HLzxAWpjQMiHWGpTIvT/ItKg+
         ENa5BGwsN54OTwaEyXus8GvM47ah49eJtVLy2SbuS6usNJmwNR838YbVQJHVnT2kYg3F
         c0VNTC/CVKqW97z8qiY7vKbm4NJexPl88ngsH6JR8kjnMmOHeXpv9YeWGljW8iFh00ZZ
         0OJYR+J5N3ZCqgOB3OYderoQ0yu6HaiUDRR/9Nk2zW1jUJVXOSCuagoVczfF0RFrQme7
         3AMw==
X-Gm-Message-State: APjAAAUHncAoOJQr0bMFJQCDAhWr6dgEbfn0mg0mflRvpe9EnF7d16/8
        OYsxNQz0gVbhs/blgIHtghk=
X-Google-Smtp-Source: APXvYqxXlDJVbbM/9nGATJKKkj0fXyQE7PEHsLDMnFti9xP8IJdGEvwk2ba65ooAfVJtvwfCwZuCzQ==
X-Received: by 2002:a63:214f:: with SMTP id s15mr6577364pgm.238.1578684313812;
        Fri, 10 Jan 2020 11:25:13 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id c26sm4110934pfj.101.2020.01.10.11.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 11:25:13 -0800 (PST)
Message-ID: <5e18cf99.1c69fb81.7b765.970d@mx.google.com>
Date:   Fri, 10 Jan 2020 11:25:12 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Paul Burton <paulburton@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 00/14] Cleanup SGI-IP27 and prepare for SGI-IP35 support
References:  <20200109123353.5656-1-tbogendoerfer@suse.de>
In-Reply-To:  <20200109123353.5656-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> SGI-IP35 alias SN1 is very similair to SGI-IP27 alias SN0, so most of the
> IP27 code could also be used for IP35. The differences will mostly be in
> header files, which are selected by CONFIG option. This series cleans up
> IP27 code/headers and prepares them for IP35 integration.
> 
> Thomas Bogendoerfer (14):
>   MIPS: SGI-IP27: use nodemask instead of cpumask
>   MIPS: SGI-IP27: use cpu physid already present while scanning for CPUs
>   MIPS: SGI-IP27: use asm/sn/agent.h for including HUB related stuff
>   MIPS: SGI-IP27: get rid of asm/sn/sn0/ip27.h
>   MIPS: SGI-IP27: move IP27 specific macro to IP27 specific header file
>   MIPS: SGI-IP27: Move get_nasid() to a IP27 specific file
>   MIPS: SGI-IP27: Split kldir.h into generic SN and IP27 parts
>   MIPS: SGI-IP27: Use union instead of typedef
>   MIPS: SGI-IP27: Use structs for decoding error status registers
>   MIPS: SGI-IP27: Use specific get_region_shift
>   MIPS: SGI-IP27: Move all shared IP27 declarations to ip27-common.h
>   MIPS: SGI-IP27: Only reserve interrupts used in Linux
>   MIPS: SGI-IP27: Store cpu speed when scanning for CPUs and use it
>     later
>   MIPS: SGI-IP27: No need for slice_map
> 
>  .../include/asm/mach-ip27/kernel-entry-init.h |  12 +-
>  arch/mips/include/asm/mach-ip27/mmzone.h      |   4 +-
>  arch/mips/include/asm/mach-ip27/topology.h    |   2 +-
>  arch/mips/include/asm/sn/arch.h               |   3 -
>  arch/mips/include/asm/sn/hub.h                |  17 --
>  arch/mips/include/asm/sn/intr.h               |  17 --
>  arch/mips/include/asm/sn/klconfig.h           |   4 -

Series applied to mips-next.

> MIPS: SGI-IP27: use nodemask instead of cpumask
>   commit 2d11e6a4ff50
>   https://git.kernel.org/mips/c/2d11e6a4ff50
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: use cpu physid already present while scanning for CPUs
>   commit d6972bb47754
>   https://git.kernel.org/mips/c/d6972bb47754
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: use asm/sn/agent.h for including HUB related stuff
>   commit b78e9d63a3b6
>   https://git.kernel.org/mips/c/b78e9d63a3b6
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: get rid of asm/sn/sn0/ip27.h
>   commit 5388b58143ea
>   https://git.kernel.org/mips/c/5388b58143ea
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: move IP27 specific macro to IP27 specific header file
>   commit 58fd034db3a9
>   https://git.kernel.org/mips/c/58fd034db3a9
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Move get_nasid() to a IP27 specific file
>   commit e9d2eb993481
>   https://git.kernel.org/mips/c/e9d2eb993481
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Split kldir.h into generic SN and IP27 parts
>   commit aa2d74f9b389
>   https://git.kernel.org/mips/c/aa2d74f9b389
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Use union instead of typedef
>   commit db96e058b4b3
>   https://git.kernel.org/mips/c/db96e058b4b3
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Use structs for decoding error status registers
>   commit 2c616e9f03db
>   https://git.kernel.org/mips/c/2c616e9f03db
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Use specific get_region_shift
>   commit 524c4e1fd412
>   https://git.kernel.org/mips/c/524c4e1fd412
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Move all shared IP27 declarations to ip27-common.h
>   commit 9d0aaf98dc24
>   https://git.kernel.org/mips/c/9d0aaf98dc24
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Only reserve interrupts used in Linux
>   commit 78691e4f17af
>   https://git.kernel.org/mips/c/78691e4f17af
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: Store cpu speed when scanning for CPUs and use it later
>   commit d31f9e64898b
>   https://git.kernel.org/mips/c/d31f9e64898b
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: No need for slice_map
>   commit d96ee783e33d
>   https://git.kernel.org/mips/c/d96ee783e33d
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
