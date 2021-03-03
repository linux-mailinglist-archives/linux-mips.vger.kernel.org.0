Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C6232BDA1
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346309AbhCCQRv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:51 -0500
Received: from mfdf0291.ocn.ad.jp ([153.149.228.243]:45903 "EHLO
        mfdf0291.ocn.ad.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356489AbhCCMN3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 07:13:29 -0500
X-Greylist: delayed 4673 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Mar 2021 07:13:27 EST
Received: from mogw1703.ocn.ad.jp (mogw1703.ocn.ad.jp [211.16.13.4])
        by mfdf0291.ocn.ad.jp (Postfix) with ESMTP id 4771C1C029D;
        Wed,  3 Mar 2021 17:31:27 +0900 (JST)
Received: from mf-smf-ucb027c1.ocn.ad.jp (mf-smf-ucb027c1.ocn.ad.jp [153.153.66.169])
        by mogw1703.ocn.ad.jp (Postfix) with ESMTP id EBE848020B;
        Wed,  3 Mar 2021 17:31:25 +0900 (JST)
Received: from ocn-vc-mts-101c1.ocn.ad.jp ([153.153.66.78])
        by mf-smf-ucb027c1.ocn.ad.jp with ESMTP
        id HMs0lzJ7DKuQ1HMujlHq5g; Wed, 03 Mar 2021 17:31:25 +0900
Received: from smtp.ocn.ne.jp ([153.149.227.133])
        by ocn-vc-mts-101c1.ocn.ad.jp with ESMTP
        id HMujldhAFH2w3HMujllNzQ; Wed, 03 Mar 2021 17:31:25 +0900
Received: from localhost (p1601136-ipoe.ipoe.ocn.ne.jp [114.172.254.135])
        by smtp.ocn.ne.jp (Postfix) with ESMTPA;
        Wed,  3 Mar 2021 17:31:25 +0900 (JST)
Date:   Wed, 03 Mar 2021 17:31:22 +0900 (JST)
Message-Id: <20210303.173122.1467075982540149385.anemo@mba.ocn.ne.jp>
To:     hch@lst.de
Cc:     linux-ide@vger.kernel.org, linux-mips@vger.kernel.org,
        geert@linux-m68k.org
Subject: Re: tx4938 and tx4939 ide drivers
From:   Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20210303074107.GA8880@lst.de>
References: <20210303074107.GA8880@lst.de>
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 3 Mar 2021 08:41:07 +0100, Christoph Hellwig <hch@lst.de> wrote:
> the tx4938 and tx4939 legacy ide drivers are some of the few that do
> not have libata equivalents, which is a bad thing given that CONFIG_IDE
> is planned to go away this year.  Are there any users of this hardware
> left, and if yes willing to help with the move to libata?

I think nobody use these drivers now.

As I wrote in
https://lore.kernel.org/lkml/20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp/
removal of these drivers does not break the only known user of TX49
boards. (i.e. Mr. Geert Uytterhoeven)

---
Atsushi Nemoto
