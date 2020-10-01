Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AE22809C1
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 23:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbgJAV4J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Oct 2020 17:56:09 -0400
Received: from elvis.franken.de ([193.175.24.41]:39086 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726855AbgJAV4J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Oct 2020 17:56:09 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kO6YQ-0005Yq-00; Thu, 01 Oct 2020 23:55:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7C95DC1051; Thu,  1 Oct 2020 23:55:48 +0200 (CEST)
Date:   Thu, 1 Oct 2020 23:55:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Kernel 5.9-rc regression.
Message-ID: <20201001215548.GA21328@alpha.franken.de>
References: <25b6a64b-b5ac-c85a-abde-909fb2d768f9@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25b6a64b-b5ac-c85a-abde-909fb2d768f9@wanyeetech.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 02, 2020 at 04:15:43AM +0800, Zhou Yanjie wrote:
> Hi Thomas and list,
> 
> There is a strange phenomenon in kernel 5.9-rc: when using kernel 5.9-rc
> with debian 10 and running htop, the memory footprint will be displayed as
> 3.99T. When the actual memory footprint increases, the displayed value will
> be reduced to 3.98T, 3.97T etc. These phenomena have been confirmed in
> X1000, X1830, and JZ4780 (disable SMP), this phenomenon does not seem to
> affect the SMP processor. When the JZ4780 turn on SMP, the memory footprint
> will be displayed normally.

try this fix

https://lore.kernel.org/lkml/20201001203931.GD2706729@carbon.DHCP.thefacebook.com/

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
