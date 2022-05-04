Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC3151AF2E
	for <lists+linux-mips@lfdr.de>; Wed,  4 May 2022 22:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378069AbiEDUge (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 May 2022 16:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234671AbiEDUgb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 May 2022 16:36:31 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3720B4FC6B;
        Wed,  4 May 2022 13:32:53 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nmLg3-0003MI-00; Wed, 04 May 2022 22:32:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DEB9BC01CC; Wed,  4 May 2022 22:28:08 +0200 (CEST)
Date:   Wed, 4 May 2022 22:28:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Joshua Kinard <kumba@gentoo.org>,
        Stephen Zhang <starzhangzsd@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] MIPS: Remove incorrect `cpu_has_fpu' overrides
Message-ID: <20220504202808.GA23391@alpha.franken.de>
References: <alpine.DEB.2.21.2205012307310.9383@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2205012307310.9383@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 01, 2022 at 11:14:11PM +0100, Maciej W. Rozycki wrote:
> Hi,
> 
>  Forcing `cpu_has_fpu' to 1 is unsupported as it breaks the `nofpu' kernel 
> parameter and more recently also the CONFIG_MIPS_FP_SUPPORT configuration 
> option.  Remove the broken `cpu_has_fpu' overrides then for IP27 and IP30 
> systems.
> 
>  This v3 of the series adds credit to Stephen for reporting the issue,
> which I forgot on previous iterations.
> 
>  Please apply.

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
