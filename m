Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B04BB181A67
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 14:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbgCKNxH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 09:53:07 -0400
Received: from elvis.franken.de ([193.175.24.41]:34363 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729692AbgCKNxH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 09:53:07 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jC1nF-0000Oq-00; Wed, 11 Mar 2020 14:53:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B2D83C1014; Wed, 11 Mar 2020 14:46:29 +0100 (CET)
Date:   Wed, 11 Mar 2020 14:46:29 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <wzssyqa@gmail.com>
Cc:     linux-mips <linux-mips@vger.kernel.org>
Subject: Re: MIPS Hardware support
Message-ID: <20200311134629.GA13742@alpha.franken.de>
References: <20200227144910.GA25011@alpha.franken.de>
 <20200311110754.GA10734@alpha.franken.de>
 <CAKcpw6Uew4e4Qus2Ox0+0RubwbfQQp+37CVKftK8EKYyrwWKsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKcpw6Uew4e4Qus2Ox0+0RubwbfQQp+37CVKftK8EKYyrwWKsQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 11, 2020 at 07:13:57PM +0800, YunQiang Su wrote:
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> 于2020年3月11日周三 下午7:08写道：
> >
> > On Thu, Feb 27, 2020 at 03:49:10PM +0100, Thomas Bogendoerfer wrote:
> > > [..]
> >
> > Thank you everybody for giving me information about your hardware.
> >
> > So we have following system types without users:
> >
> > [..]
> > Cavium Networks Octeon SoC based boards (CAVIUM_OCTEON_SOC)
> 
> We are using it for our Debian build farm, and they are quite important.

good to know, and if I haven't made it clear enough, I only want to
drop the three listed platforms below.

> > LASAT Networks platforms (LASAT)
> > NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
> > PMC-Sierra MSP chipsets (PMC_MSP)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
