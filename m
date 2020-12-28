Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1210C2E6BA4
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 00:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730777AbgL1Wzy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 17:55:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:43800 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729426AbgL1Ud7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 15:33:59 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ktzCg-0004nD-00; Mon, 28 Dec 2020 21:33:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 98151C0565; Mon, 28 Dec 2020 20:59:30 +0100 (CET)
Date:   Mon, 28 Dec 2020 20:59:30 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/6] fbdev: Add n64rdp driver
Message-ID: <20201228195930.GA23291@alpha.franken.de>
References: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
 <20201228105034.GB3606@alpha.franken.de>
 <20201228202416.1b624c273a442334a207080a@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228202416.1b624c273a442334a207080a@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 28, 2020 at 08:24:16PM +0200, Lauri Kasanen wrote:
> Do I understand correctly that this is a "yes" to the "is it worth it
> to upstream a port for a platform this ancient"?

yes it is ;-) As long as hardware is available and someone cares
I'll include support for ancient platforms.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
