Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8902DFBCC1
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 01:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfKMX74 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Nov 2019 18:59:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbfKMX74 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Nov 2019 18:59:56 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 927B6206EE;
        Wed, 13 Nov 2019 23:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573689595;
        bh=an73RoCEpEY4XTHg9/CJPsUgM/+xPI7xEYL5UWkn8wY=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=KVXFppjrpKPUhInreh3eWJeoaCWQlOvCbQy4T6yc1iqduMXlETStW4X0/cV2yQ6Ee
         E85DW0KX5Ho0siUwyw6r//HEMWtB/w9jwiUt8H+VmIf4gh7m4xVFMa00OVfZO/3E8N
         /CoWBhTmYJO/HZPtata10Kjm/6/1s4TJVZeRiEFc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191112005544.GB7038@bogus>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com> <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com> <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com> <20191112005544.GB7038@bogus>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, paul.burton@mips.com, robh+dt@kernel.org,
        syq@debian.org, mark.rutland@arm.com, paul@crapouillou.net
To:     Rob Herring <robh@kernel.org>, Zhou Yanjie <zhouyanjie@zoho.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: Add X1000 bindings.
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 15:59:54 -0800
Message-Id: <20191113235955.927B6206EE@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Rob Herring (2019-11-11 16:55:44)
> On Sun, 10 Nov 2019 17:28:21 +0800, Zhou Yanjie wrote:
> > Add the clock bindings for the X1000 Soc from Ingenic.
> >=20
> > Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> > ---
> >  .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
> >  include/dt-bindings/clock/x1000-cgu.h              | 44 ++++++++++++++=
++++++++
> >  2 files changed, 45 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/x1000-cgu.h
> >=20
>=20
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>=20
> If a tag was not added on purpose, please state why and what changed.

It looks like some extra defines were added. I carried forward your
review tag.

