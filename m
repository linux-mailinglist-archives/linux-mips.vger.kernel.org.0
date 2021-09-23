Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661AF415B2C
	for <lists+linux-mips@lfdr.de>; Thu, 23 Sep 2021 11:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240216AbhIWJn5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Sep 2021 05:43:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:39101 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240129AbhIWJn4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Sep 2021 05:43:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mTLFI-00072a-03
        for linux-mips@vger.kernel.org; Thu, 23 Sep 2021 11:42:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D96BAC1CE2; Thu, 23 Sep 2021 11:42:15 +0200 (CEST)
Date:   Thu, 23 Sep 2021 11:42:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: What about removing Netlogic support ?
Message-ID: <20210923094215.GD7289@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

is anybody still interested in having Netlogic support ?

I couldn't find any usefull docs, eval boards on Ebay are rare and look
imcomplete and it's not clear in which devices it's used (and even if this
known it doesn't look like getting Linux running there is easy).

So if nobody objects I'm going to remove netlogic support.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
