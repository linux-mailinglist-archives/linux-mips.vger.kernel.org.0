Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E97B327FFC
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 14:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbhCANu7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 08:50:59 -0500
Received: from elvis.franken.de ([193.175.24.41]:33583 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235514AbhCANu5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 08:50:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lGiwA-0003Jo-00; Mon, 01 Mar 2021 14:50:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 745B8C0D76; Mon,  1 Mar 2021 13:33:25 +0100 (CET)
Date:   Mon, 1 Mar 2021 13:33:25 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mips: smp-bmips: fix CPU mappings
Message-ID: <20210301123325.GA7863@alpha.franken.de>
References: <20210223124817.26486-1-noltari@gmail.com>
 <20210224073336.32265-1-noltari@gmail.com>
 <F06822DE-1335-40E8-944D-CACC423FAB87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F06822DE-1335-40E8-944D-CACC423FAB87@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 27, 2021 at 07:47:42AM +0100, Álvaro Fernández Rojas wrote:
> Hi all,
> 
> Apparently, this patch was flagged as "Not Applicable" without an
> explanation. Why?

hmm, I probaly wanted to drop the first version, but changed v2. It's
back to new again and I'm gogin to apply it soon.

Sorry about that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
