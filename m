Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15B7554DFD
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 16:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358508AbiFVOyX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 22 Jun 2022 10:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358119AbiFVOyV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 10:54:21 -0400
X-Greylist: delayed 489 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Jun 2022 07:54:21 PDT
Received: from relay3.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA2B26ACF
        for <linux-mips@vger.kernel.org>; Wed, 22 Jun 2022 07:54:21 -0700 (PDT)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay08.hostedemail.com (Postfix) with ESMTP id 880A0211D8;
        Wed, 22 Jun 2022 14:46:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 1E1AA38;
        Wed, 22 Jun 2022 14:46:06 +0000 (UTC)
Message-ID: <37d560bc5267408eb9cc806339025418094cf5bb.camel@perches.com>
Subject: Re: [PATCH] MIPS: Fix 2 typos
From:   Joe Perches <joe@perches.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Zhang Jiaming <jiaming@nfschina.com>, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liqiong@nfschina.com, renyu@nfschina.com
Date:   Wed, 22 Jun 2022 07:46:01 -0700
In-Reply-To: <d2112863-bd28-d6db-c353-1b7b94b45fcb@infradead.org>
References: <20220622090713.24370-1-jiaming@nfschina.com>
         <d2112863-bd28-d6db-c353-1b7b94b45fcb@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Stat-Signature: abnynm7f41xexum4qqrwzek1ynrc653a
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 1E1AA38
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19lgcxluOxcGqjU5XTKXoTq92I4KprCEbA=
X-HE-Tag: 1655909166-228282
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2022-06-22 at 07:28 -0700, Randy Dunlap wrote:
> On 6/22/22 02:07, Zhang Jiaming wrote:
> > Change 'modifed' to 'modified'.
> > Change 'relys' to 'relays'.
[]
> > diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
[]
> > @@ -282,9 +282,9 @@ union cvmx_helper_link_info __cvmx_helper_board_link_get(int ipd_port)
> >   * support and should return the number of actual ports on the
> >   * board.
> >   *
> > - * This function must be modifed for every new Octeon board.
> > + * This function must be modified for every new Octeon board.
> >   * Internally it uses switch statements based on the cvmx_sysinfo
> > - * data to determine board types and revisions. It relys on the
> 
>                                                       relies
> 
> But it would be better to restrict this barrage (or swarm) of patches
> to Kconfig help text problems and/or strings that are printed to users.

I believe fixing typos isn't a particular problem and is
overall rather a good thing.

Though backporting these patches would be silly.

