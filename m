Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6646B26426B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 11:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbgIJJhr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 05:37:47 -0400
Received: from elvis.franken.de ([193.175.24.41]:33971 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730461AbgIJJhq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Sep 2020 05:37:46 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kGJ1U-00030W-00; Thu, 10 Sep 2020 11:37:44 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 905F6C0F61; Thu, 10 Sep 2020 11:37:09 +0200 (CEST)
Date:   Thu, 10 Sep 2020 11:37:09 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jim Quinlan <james.quinlan@broadcom.com>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v1] MIPS: uasm: false warning on use of
 uasm_i_lui()
Message-ID: <20200910093709.GA10310@alpha.franken.de>
References: <20200908164512.15379-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908164512.15379-1-james.quinlan@broadcom.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 08, 2020 at 12:45:06PM -0400, Jim Quinlan wrote:
> Currently, the example uasm code
> 
> 	uasm_i_lui(p, tmp, 0xa000);
> 
> issues a warning at Linux boot when the code is "assembled".  This is
> because the "lui" instruction is defined by the macro "Ip_u1s2(_lui)" -- I
> believe it should be Ip_u1u2(_lui) -- and its definition is associated with
> the SIMM macro -- I believe it should be the UIMM macro.  The current code
> takes a 32bit number and checks that it can be converted to a 16bit signed
> immediate.  This check fails of course for an immediate such as 0x0000a000.

IMHO SIMM is correct as the upper 16bits will be sign extended on 64bit
CPUs.

Your example looks like to try to load a KSEG1 address, so just use 

uasm_i_lui(p, tmp, uasm_rel_hi(0xa0000000));

which even makes it clearer, what this is about.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
