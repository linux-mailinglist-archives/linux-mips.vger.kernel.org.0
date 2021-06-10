Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FBC3A3337
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhFJSjz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhFJSjy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:39:54 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26A58C061574;
        Thu, 10 Jun 2021 11:37:58 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id ECBCA92009E; Thu, 10 Jun 2021 20:37:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E709D92009D;
        Thu, 10 Jun 2021 20:37:53 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:37:53 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] serial, Malta: Fixes to make the CBUS UART work
 big-endian
Message-ID: <alpine.DEB.2.21.2105161721220.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

 Earlier this year I noticed the CBUS UART, a discrete TI16C550C part 
wired directly to the system controller's device bus and supposed to come 
up as ttyS2 in addition to ttyS0 and ttyS1 ports from a Super I/O device 
behind the PCI southbridge, is not recognised with my MIPS Malta board 
booting big-endian.

 I used to use it just fine, many many years ago, although in the board's 
little-endian configuration only, and then with a local patch to get it 
supported with Linux 2.4.x, which I didn't get to submitting however due 
to the turn of events back then.  Support was then added by someone else 
with 2.6.23.

 I got to the bottom of the problem now and as it turns out we have two 
long-standing bugs causing it, one in generic 8250 code and another in 
Malta platform code, and this has never worked in the big-endian mode.  
Evidently, this has never been verified, and I guess this is because back 
in the MIPS UK days we usually ran the boards in the little-endian mode.

 This pair of patches addresses these bugs individually.  See the 
respective change descriptions for details.

 Please apply.

  Maciej
