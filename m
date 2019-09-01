Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5AF8A4AE4
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 19:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfIARhB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 13:37:01 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:32587 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIARhA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 13:37:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id F0EA83F771;
        Sun,  1 Sep 2019 19:36:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oY_sST62O6du; Sun,  1 Sep 2019 19:36:58 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3967A3F6FD;
        Sun,  1 Sep 2019 19:36:57 +0200 (CEST)
Date:   Sun, 1 Sep 2019 19:36:57 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 011/120] MIPS: R5900: Avoid pipeline hazard with the TLBP
 instruction
Message-ID: <20190901173657.GA24945@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <d3b43e48be1b888c4bd675dc4c0633dc1e8fe791.1567326213.git.noring@nocrew.org>
 <314ae9e1-80d2-68f7-4942-c04e25dc60ef@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <314ae9e1-80d2-68f7-4942-c04e25dc60ef@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergei,

> > +	case CPU_R5900:
> > +		/*
> > +		 * On the R5900, the TLBWP instruction must be immediately
> 
>    So is it TLBP or TLBWP?

TLBWP does not exist, so it must be TLBP. Thanks! :)

Fredrik
