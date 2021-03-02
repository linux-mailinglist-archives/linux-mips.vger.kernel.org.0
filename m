Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F35A32AF8C
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238108AbhCCA0a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:26:30 -0500
Received: from elvis.franken.de ([193.175.24.41]:37885 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233744AbhCBXzP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Mar 2021 18:55:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lHEqL-00081Z-00; Wed, 03 Mar 2021 00:54:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9E33BC03C2; Tue,  2 Mar 2021 23:56:44 +0100 (CET)
Date:   Tue, 2 Mar 2021 23:56:44 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: mips DMA buildbot fixes
Message-ID: <20210302225644.GA3808@alpha.franken.de>
References: <20210301073832.919371-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301073832.919371-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 08:38:29AM +0100, Christoph Hellwig wrote:
> Hi Thomas,
> 
> this series fixes a few trivial warnings in the mips DMA code that the
> buildbot keeps complaining about.

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
