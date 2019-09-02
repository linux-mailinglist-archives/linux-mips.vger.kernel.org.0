Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABFCA5A30
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 17:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfIBPJP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 11:09:15 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:10674 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfIBPJP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 11:09:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 730103FAAC;
        Mon,  2 Sep 2019 17:09:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ShyeUYyKhmGN; Mon,  2 Sep 2019 17:09:12 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id C0FB53FA43;
        Mon,  2 Sep 2019 17:09:12 +0200 (CEST)
Date:   Mon, 2 Sep 2019 17:09:12 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 001/120] MIPS: R5900: Initial support for the Emotion
 Engine in the PlayStation 2
Message-ID: <20190902150912.GB2479@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <074470b707e277f2277bfedfe89ee4acbe159396.1567326213.git.noring@nocrew.org>
 <alpine.LFD.2.21.1909012203460.2031@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1909012203460.2031@eddie.linux-mips.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>  Hmm, I don't know why PRID_IMP_TX49 has been misplaced, 18 years ago with 
> commit b8c80cd25ffe ("Add missing PrId values for TX39 / TX 49 CPUs."), 
> however I suggest that PRID_IMP_R5900 does not make things worse.  I.e. 
> please place it between PRID_IMP_NEVADA and PRID_IMP_RM9000.

Done, thanks!

Fredrik
