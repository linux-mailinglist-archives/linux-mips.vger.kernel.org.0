Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62FB1731337
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jun 2023 11:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245458AbjFOJI6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jun 2023 05:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245399AbjFOJIw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jun 2023 05:08:52 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 48004296E;
        Thu, 15 Jun 2023 02:08:43 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1q9ixo-0005Cv-00; Thu, 15 Jun 2023 11:08:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 95D84C02FB; Thu, 15 Jun 2023 11:08:04 +0200 (CEST)
Date:   Thu, 15 Jun 2023 11:08:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>, list@opendingux.net,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/9] MIPS: CI20: Add WiFi / Bluetooth support
Message-ID: <20230615090804.GA8625@alpha.franken.de>
References: <E1q9iWM-0004zB-00@elvis.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1q9iWM-0004zB-00@elvis.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 15, 2023 at 10:39:53AM +0200, Paul Cercueil wrote:
> Thomas: are you able to drop this series from mips-next, or should I/we send fixup patches instead?

as I'm not rebasing mips-next I need fixup patches. This won't solve
bisectability, but not doing rebases is the what Linus prefers.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
