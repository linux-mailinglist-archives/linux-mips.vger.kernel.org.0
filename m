Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09FC191F4A
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgCYChD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:37:03 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:40720 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYChA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 22:37:00 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992798AbgCYCg5y2cvG (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Wed, 25 Mar 2020 03:36:57 +0100
Date:   Wed, 25 Mar 2020 02:36:57 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Christoph Hellwig <hch@lst.de>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: remove cpu_has_64bit_gp_regs and
 cpu_has_64bit_addresses
In-Reply-To: <20200324161525.754181-2-hch@lst.de>
Message-ID: <alpine.LFD.2.21.2003250226450.2689954@eddie.linux-mips.org>
References: <20200324161525.754181-1-hch@lst.de> <20200324161525.754181-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 24 Mar 2020, Christoph Hellwig wrote:

> Both macros are always identical to CONFIG_64BIT.

 I think this abstraction makes sense, especially if we want to support 
64-bit CPUs that only support 32-bit segments, i.e. MIPS architecture 
processors whose CP0.Config.AT=1, or legacy MIPS processors that had a 
similar limitation, such as the R5900 currently under review.

  Maciej
