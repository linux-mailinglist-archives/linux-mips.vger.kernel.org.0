Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF47C5B84FF
	for <lists+linux-mips@lfdr.de>; Wed, 14 Sep 2022 11:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbiINJc2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Sep 2022 05:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiINJcH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Sep 2022 05:32:07 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E3EF67A518
        for <linux-mips@vger.kernel.org>; Wed, 14 Sep 2022 02:22:37 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 8CA4A92009C; Wed, 14 Sep 2022 11:22:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 862AB92009B;
        Wed, 14 Sep 2022 10:22:35 +0100 (BST)
Date:   Wed, 14 Sep 2022 10:22:35 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Dmitry Grinberg <dmitrygr@gmail.com>
cc:     linux-mips@vger.kernel.org
Subject: Re: small fix for DECstation PROM memory probing
In-Reply-To: <CAMyDq_5SuzxuTi+mvo2COJyp=K+Pd4CmAW6ufaGoZ+S2hLyXEQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2209140942151.60554@angie.orcam.me.uk>
References: <CAMyDq_5SuzxuTi+mvo2COJyp=K+Pd4CmAW6ufaGoZ+S2hLyXEQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Sep 2022, Dmitry Grinberg wrote:

> The comment is correct, the code is missing a single "0" to be correct. As
> is only 30MB of memory will be probed.

 Thank you for your submission.  Technically you are correct, although in 
reality PMAX machines only have up to 24MiB of RAM, so this bug won't ever 
trigger.  This would only matter for early 3MAX machines, before the ROM 
upgrade to the REX standard.  I would expect all the existing machines to 
have been converted by now.

 I guess your patch can be accepted anyway, however there are a couple of 
issues with it as below.

> commit 91aa935a527d88e8fd5f40acd271164a3e8f1ae7
> Author: Dmitry Grinberg <dmitrygr@gmail.com>
> Date:   Tue Aug 30 01:25:29 2022 -0500
> 
>     fix pmax memory limit to match comment

 Please capitalise the change heading and prefix it with the name of the 
subsystem(s) involved, e.g.:

MIPS: DEC: Fix pmax memory limit to match comment

 Please add a change description, e.g by reusing the text you have used 
for the introduction, and add a `Signed-off-by' tag, as per 
`Documentation/process/submitting-patches.rst'.  Verify your change by 
running it through `scripts/checkpatch.pl', e.g.:

$ git format-patch --stdout 91aa935a527d^- | scripts/checkpatch.pl

 Please make your submission the sole contents of the e-mail.  If your 
mailer restricts you in some way, then use `git send-email'.

 Last but not least please send your submission to the correct MIPS/Linux 
mailing list, which now is <linux-mips@vger.kernel.org>, and also cc the 
general Linux kernel mailing list at <linux-kernel@vger.kernel.org>.  You 
can get the expected list of recipients with `scripts/get_maintainer.pl', 
e.g.:

$ git format-patch --stdout 91aa935a527d^- | scripts/get_maintainer.pl

 Please let me know if you find anything I wrote unclear or need further 
guidance.

 Thanks,

  Maciej
