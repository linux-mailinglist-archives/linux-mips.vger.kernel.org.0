Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEFCE179530
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 17:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388042AbgCDQ2E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Mar 2020 11:28:04 -0500
Received: from elvis.franken.de ([193.175.24.41]:50872 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388019AbgCDQ2D (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Mar 2020 11:28:03 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1j9WsL-000509-00; Wed, 04 Mar 2020 17:28:01 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B264DC0EF6; Wed,  4 Mar 2020 17:22:49 +0100 (CET)
Date:   Wed, 4 Mar 2020 17:22:49 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "dtb ." <carlojpisani@gmail.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: MIPS Hardware support
Message-ID: <20200304162249.GA14388@alpha.franken.de>
References: <20200227144910.GA25011@alpha.franken.de>
 <CA+QBN9DRUMkd+cOvHMJfe_-7rdhUpb=BiC7BBWN2ZS5-fNXtfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+QBN9DRUMkd+cOvHMJfe_-7rdhUpb=BiC7BBWN2ZS5-fNXtfw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 02, 2020 at 09:35:09AM +0100, dtb . wrote:
> when (which kernel future release?) do you think it will be possible
> to have a working PCI subsystem with SGI IP30? I'd love to use a
> PCI_EHCI card, and a PCI_SATA card for a couple of practical projects.

32bit DMA support for bridge (which is needed at least for EHCI) is
on my todo list, but it's not top priority.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
