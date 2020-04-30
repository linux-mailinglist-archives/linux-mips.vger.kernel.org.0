Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5354A1BF7FC
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 14:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgD3MRa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 08:17:30 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:52222 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgD3MRa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 08:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588249046; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mrqQpdZI0iA0rbOEiH2YGzwk2jM3qRIXYq5akaHCo94=;
        b=CcBdNJB/RZtu/4OVh1Z8vh03ug8YYH5He/qLM2zyCLxzfZFpV5IG6ARTJgsFQsQL6poT2n
        jklgKb49O+UF7UxaD6g+I+nSsS3i8p1KLArlFmGRxUqzPTYi3RZ67vNu0+dhX+MWUZB7Ru
        FOaCSE83nh75F/E1E4X3RbjurNnM3z0=
Date:   Thu, 30 Apr 2020 14:17:16 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 07/13] MIPS: ingenic: DTS: Respect cell count of common
 properties
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <SSOL9Q.SPOBZNC76Y5J2@crapouillou.net>
In-Reply-To: <20200429210416.GB24583@alpha.franken.de>
References: <20200413152633.198301-1-paul@crapouillou.net>
        <20200413152633.198301-7-paul@crapouillou.net>
        <20200429210416.GB24583@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Le mer. 29 avril 2020 =E0 23:04, Thomas Bogendoerfer=20
<tsbogend@alpha.franken.de> a =E9crit :
> On Mon, Apr 13, 2020 at 05:26:27PM +0200, Paul Cercueil wrote:
>>  If N fields of X cells should be provided, then that's what the
>>  devicetree should represent, instead of having one single field of
>>  (N*X) cells.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/mips/boot/dts/ingenic/jz4740.dtsi | 19 +++++++++----------
>>   arch/mips/boot/dts/ingenic/jz4770.dtsi | 12 +++++-------
>>   arch/mips/boot/dts/ingenic/jz4780.dtsi | 24=20
>> +++++++++++-------------
>>   arch/mips/boot/dts/ingenic/x1000.dtsi  |  9 ++++-----
>>   4 files changed, 29 insertions(+), 35 deletions(-)
>=20
> applied to mips-next. Please check if my resolution of the conflict
> in arch/mips/boot/dts/ingenic/jz4780.dtsi is correct.

Looks good, thanks.

-Paul

> Thomas.
>=20
> --
> Crap can work. Given enough thrust pigs will fly, but it's not=20
> necessarily a
> good idea.                                                [ RFC1925,=20
> 2.3 ]


