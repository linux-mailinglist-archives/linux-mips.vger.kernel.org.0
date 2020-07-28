Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72CB2308D4
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 13:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgG1Lhe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 07:37:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:51866 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729102AbgG1Lhe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 07:37:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k0Nuy-0002BT-00; Tue, 28 Jul 2020 13:37:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B504AC0A94; Tue, 28 Jul 2020 13:36:36 +0200 (CEST)
Date:   Tue, 28 Jul 2020 13:36:36 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/2] MIPS: ingenic: Enable JZ4780_NEMC manually
Message-ID: <20200728113636.GA13443@alpha.franken.de>
References: <20200728104503.23655-1-krzk@kernel.org>
 <20200728104503.23655-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728104503.23655-2-krzk@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 28, 2020 at 12:45:03PM +0200, Krzysztof Kozlowski wrote:
> The CONFIG_JZ4780_NEMC was previously a default on MIPS but now it has
> to be enabled manually.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
