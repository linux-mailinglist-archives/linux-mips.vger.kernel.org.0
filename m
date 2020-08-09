Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C84623FD6F
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 10:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgHIItB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Aug 2020 04:49:01 -0400
Received: from elvis.franken.de ([193.175.24.41]:40236 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgHIItA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 9 Aug 2020 04:49:00 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k4h0l-0006wj-00
        for linux-mips@vger.kernel.org; Sun, 09 Aug 2020 10:48:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A79D6C0C9C; Sun,  9 Aug 2020 10:48:52 +0200 (CEST)
Date:   Sun, 9 Aug 2020 10:48:52 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: Removing NXP STB22x support ?
Message-ID: <20200809084852.GA5754@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

I've again looked at the list of supported systems and checked, if there
is at least a slight chance to get hands on real hardware and couldn't
find one for

NXP STB220 board (NXP_STB220)
NXP 225 board (NXP_STB225)

So I plan to remove support for these in 5.10. If anybody owns one
of these and wants to keep Linux support, please speak up.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
