Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52DCB1AA1EA
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 14:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370252AbgDOMrS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 08:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370242AbgDOMrJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 08:47:09 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC4BC061A0C;
        Wed, 15 Apr 2020 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586954825;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6/o2eUBt4iN9I0U74c2I8jHNfikxj7yqfISGp3x31ZE=;
        b=lNs6HWucThpy3Ne1/nN6kfg7hfbpHhjXSde+1bdtjW3wQqRp1cvazGDuvc3fhe2NzZ
        iLP4AMbcSbM074ClW6SKnXojI9Sg1fuOqNEcfx1L/JAoiPzK9a1KrJWwNcVBDzo8vtFs
        cNFiftqcZuFF0kq2tE0oF2HXXRtN8M/I0zM3/pr7MHFQAX3pOoui7zrIGv6WfKJnTo1e
        pVwJjGNEQ/MbNyeydyj2yzKCv6FJPmN/fQR/LR1qQBJ7Kg5nqhLURx9qT9K18rU1uHbl
        H1raH6FCY2ZuQduRe07zuOEZdR1dwGYmFebMlJuTXeh4sjvhf7vKrNU4lHaIkNHw3vtX
        Lbzw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCz3b9m9rH79DVZTKLB3vWvm2T1hRBz6in0C9d6y"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26b3:fd00:4058:8a66:740e:2249]
        by smtp.strato.de (RZmta 46.4.0 AUTH)
        with ESMTPSA id 6028a2w3FCkp1ws
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 14:46:51 +0200 (CEST)
Subject: Re: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
Date:   Wed, 15 Apr 2020 13:46:06 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EFA7F2F0-96EA-45D9-B8C8-00DC8C72344D@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com> <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Krzysztof,

> Am 15.04.2020 um 13:38 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
>>=20
>> and add interrupt.
>>=20
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.
>=20
> Don't add your own Tested-by tags. These are implied by authorship,
> otherwise all patches people make should have such tag.

Ok I see. AFAIR it originates in several phases of editing to report on =
which device it was tested.

Is there a canonical way of writing "tested-on: ${HARDWARE}"?

E.g. would this be ok?

Signed-off: H. Nikolaus Schaller <hns@goldelico.com> # tested on =
Pyra-Handheld

BR and thanks,
Nikolaus Schaller

