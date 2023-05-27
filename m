Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 842297136F8
	for <lists+linux-mips@lfdr.de>; Sun, 28 May 2023 00:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjE0WWV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 May 2023 18:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjE0WWU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 May 2023 18:22:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982F5B2;
        Sat, 27 May 2023 15:22:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 28E38601CE;
        Sat, 27 May 2023 22:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996A3C433D2;
        Sat, 27 May 2023 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685226137;
        bh=RQbPwtUFlOO/j4cghI7uTbgXFUXeT5XXXbs1K8GSWzw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D3Cz+xkH79pPT6VkV0dT54IJLVngI9rk7nykUcvru5eIoyjZjxIihOOKWMoDjxZWI
         gI1XLqPkHubk6l/SdlDNcNm5BEr7JDuCPp8hskXttk1wBsSxvo2GDyJjy2qIcM6oRF
         ccR9pVSoGUDNuk3CjBVRvGmfWbMvW14Qab4Yf1/EiYKm7Z9zFRRjdmLzburcnRgz1Q
         an/Vd+ol+YP1hEea90N3QOzuyXrZi+pVgToz+otji27Fax/9ApktMoBVIP3ECgn4tG
         qNbIPP3Ni9BIm/xMdEzEBdtyAe6glIY9N3ScEvsL0X388cn4bV0dX89d4GAIVSQTD4
         rBVDvMO2WHN6w==
Date:   Sat, 27 May 2023 23:22:08 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Kelvin Cheung <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the
 trivial RTCs
Message-ID: <20230527-poet-antarctic-cc02aa60ab52@spud>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
 <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com>
 <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hHFk4HMLBq5Kj71s"
Content-Disposition: inline
In-Reply-To: <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--hHFk4HMLBq5Kj71s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
> > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley <conor@ke=
rnel.org> =E5=86=99=E9=81=93=EF=BC=9A
> > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:

> >> My recommendation is leaving compatible string as is.
> >=20
> > "as is" meaning "as it is right now in Linus' tree", or "as it is in
> > this patch"?
>=20
> Ah sorry I meant in this patch.
>=20
> Since there won=E2=80=99t be any new ls1x chip that will boot Linux any t=
ime soon (due to
> Loongson move away from MIPS but LoongArch32 is undefined for now), and
> rest compatible strings are wide enough to cover their family, I think th=
e present
> compatible strings in this patch describes hardware best.

I don't see why new bindings being written for old hardware should somehow
be treated differently than new bindings for new hardware.

--hHFk4HMLBq5Kj71s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHKCkAAKCRB4tDGHoIJi
0rXzAQD0SAoVo2InlVy9paLA3w315fNtrSwm3P+hLkb6YzsbCAD6AsPaMqzeV9g/
QKQHnRlgXycNG532zbpWzD0/cjCssAo=
=9t1x
-----END PGP SIGNATURE-----

--hHFk4HMLBq5Kj71s--
