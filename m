Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B1D23F7D4
	for <lists+linux-mips@lfdr.de>; Sat,  8 Aug 2020 15:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgHHNmH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Aug 2020 09:42:07 -0400
Received: from elvis.franken.de ([193.175.24.41]:39026 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726190AbgHHNmE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 8 Aug 2020 09:42:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k4P6k-0004vB-00; Sat, 08 Aug 2020 15:41:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 19B0AC0C98; Sat,  8 Aug 2020 15:41:47 +0200 (CEST)
Date:   Sat, 8 Aug 2020 15:41:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix
 writecombine issue for Loongson64
Message-ID: <20200808134147.GA5772@alpha.franken.de>
References: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 08, 2020 at 03:25:02PM +0800, Tiezhu Yang wrote:
> Loongson processors have a writecombine issue that maybe failed to
> write back framebuffer used with ATI Radeon or AMD GPU at times,
> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
> mapping for MIPS"), there exists some errors such as blurred screen
> and lockup, and so on.
> 
> Remove the flag TTM_PL_FLAG_WC of VRAM to fix writecombine issue for
> Loongson64 to work well with ATI Radeon or AMD GPU, and it has no any
> influence on the other platforms.

well it's not my call to take or reject this patch, but I already
indicated it might be better to disable writecombine on the CPU
detection side (or do you have other devices where writecombining
works ?). Something like below will disbale it for all loongson64 CPUs.
If you now find out where it works and where it doesn't, you can even
reduce it to the required minium of affected CPUs.

Thomas.


diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index def1659fe262..cdd87009e931 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2043,7 +2043,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 			set_isa(c, MIPS_CPU_ISA_M64R2);
 			break;
 		}
-		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_EXT |
 				MIPS_ASE_LOONGSON_EXT2);
 		break;
@@ -2073,7 +2072,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		 * register, we correct it here.
 		 */
 		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
-		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
 		c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
@@ -2084,7 +2082,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		set_elf_platform(cpu, "loongson3a");
 		set_isa(c, MIPS_CPU_ISA_M64R2);
 		decode_cpucfg(c);
-		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		break;
 	default:
 		panic("Unknown Loongson Processor ID!");

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
