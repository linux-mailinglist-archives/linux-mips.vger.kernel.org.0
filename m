Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295462F48EB
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 11:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbhAMKoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 05:44:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:47746 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727398AbhAMKoq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 05:44:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kzddE-00021m-03; Wed, 13 Jan 2021 11:44:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 83345C02B1; Wed, 13 Jan 2021 11:09:00 +0100 (CET)
Date:   Wed, 13 Jan 2021 11:09:00 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     robh+dt@kernel.org, john@phrozen.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway CGU
 bindings
Message-ID: <20210113100900.GD10351@alpha.franken.de>
References: <20210101180118.2496-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210101180118.2496-1-olek2@wp.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 01, 2021 at 07:01:18PM +0100, Aleksander Jan Bajkowski wrote:
> Document the Lantiq Xway SoC series Clock Generation Unit (CGU) bindings.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/mips/lantiq/lantiq,cgu.yaml      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,cgu.yaml

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
