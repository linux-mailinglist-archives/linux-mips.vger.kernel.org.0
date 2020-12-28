Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F572E3618
	for <lists+linux-mips@lfdr.de>; Mon, 28 Dec 2020 11:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgL1Kwx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 05:52:53 -0500
Received: from elvis.franken.de ([193.175.24.41]:43079 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgL1Kwx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 05:52:53 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ktq8K-00054l-02; Mon, 28 Dec 2020 11:52:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CC49EC0565; Mon, 28 Dec 2020 11:51:51 +0100 (CET)
Date:   Mon, 28 Dec 2020 11:51:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/6] Revert "MIPS: Remove unused R4300 CPU support"
Message-ID: <20201228105151.GC3606@alpha.franken.de>
References: <20201225185946.d67607fe16e324c56f9a2f46@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201225185946.d67607fe16e324c56f9a2f46@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 25, 2020 at 06:59:46PM +0200, Lauri Kasanen wrote:
> This reverts commit f9065b54d437c4660e3d974ad9ce5188c068cd76.

Please add a reason for the revert. It's clear when looking at your
series, but not from pure looking later via git at this commit.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
