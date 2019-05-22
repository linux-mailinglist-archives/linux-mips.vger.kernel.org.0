Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7F826439
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 15:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfEVNBz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 09:01:55 -0400
Received: from mfdf018.ocn.ad.jp ([153.128.50.74]:47501 "EHLO
        mfdf018.ocn.ad.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfEVNBz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 09:01:55 -0400
X-Greylist: delayed 3759 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 May 2019 09:01:54 EDT
Received: from mogw1117.ocn.ad.jp (mogw1117.ocn.ad.jp [153.149.229.18])
        by mfdf018.ocn.ad.jp (Postfix) with ESMTP id 5EF8AB833F4;
        Wed, 22 May 2019 20:59:14 +0900 (JST)
Received: from mf-smf-ucb027c1 (mf-smf-ucb027c1.ocn.ad.jp [153.153.66.169])
        by mogw1117.ocn.ad.jp (Postfix) with ESMTP id A477010024B;
        Wed, 22 May 2019 20:59:11 +0900 (JST)
Received: from ocn-vc-mts-106c1.ocn.ad.jp ([153.138.237.145])
        by mf-smf-ucb027c1 with ESMTP
        id TPtRhMACBSCYXTPtnh03nk; Wed, 22 May 2019 20:59:11 +0900
Received: from smtp.ocn.ne.jp ([153.149.227.134])
        by ocn-vc-mts-106c1.ocn.ad.jp with ESMTP
        id TPtnhgZNHygxgTPtnh4pgH; Wed, 22 May 2019 20:59:11 +0900
Received: from localhost (p1677051-ipngn9301funabasi.chiba.ocn.ne.jp [118.0.44.51])
        by smtp.ocn.ne.jp (Postfix) with ESMTPA;
        Wed, 22 May 2019 20:59:11 +0900 (JST)
Date:   Wed, 22 May 2019 20:59:07 +0900 (JST)
Message-Id: <20190522.205907.488743218624330444.anemo@mba.ocn.ne.jp>
To:     geert@linux-m68k.org
Cc:     fancer.lancer@gmail.com, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org, rppt@linux.ibm.com, macro@linux-mips.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: TXx9: Fix boot crash in free_initmem()
From:   Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20190522081535.16583-1-geert@linux-m68k.org>
References: <20190522081535.16583-1-geert@linux-m68k.org>
X-Fingerprint: 6ACA 1623 39BD 9A94 9B1A  B746 CA77 FE94 2874 D52F
X-Pgp-Public-Key: http://wwwkeys.pgp.net:11371/pks/lookup?op=get&search=0x2874D52F
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 22 May 2019 10:15:35 +0200, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On rbtx4927:
...
> As of commit b93ddc4f9156205e ("mips: Reserve memory for the kernel
> image resources"), bootmem_init() no longer reserves the memory below
> the kernel, while prom_free_prom_memory() still frees it.
> 
> Fix this by reverting commit b6263ff2d6e58cc2 ("MIPS: TXx9: Implement
> prom_free_prom_memory").
> 
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> Fixes: b93ddc4f9156205e ("mips: Reserve memory for the kernel image resources")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thank you for fixing this.  It looks OK for me.

Reviewed-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

---
Atsushi Nemoto
