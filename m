Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EEC774D00
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 23:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235578AbjHHVZK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 17:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235519AbjHHVZK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 17:25:10 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D8990
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 14:25:07 -0700 (PDT)
Received: from [192.168.1.166] ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id THPBqHCO9Pm6CTHPBq8ssJ; Tue, 08 Aug 2023 09:45:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691480726; bh=dK8y32VSPfv+uSmARxH/e37aIn+O3g97fmYoKJta8qw=;
        h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
        b=HCsEgBNiY5ROL/dh0khzXv4yMIKED5HaYSQJMzZlqk2US/LX3Xj+P6DYAG/NK/j7V
         dCTVSnhW+fns4ZlYEbXckXiMKWU0XKuStJzWRhhe8HzsGzmKHxhn+xMWlFGkL7ERk5
         wZGRQcXu+X+aTO3EAYyjdbIk7hV1E4C+ThFI9/F5aDtnwnQqe2QBOeaCiVFioYVaOA
         2zdfZntSBr2RE1FMJIJJ4787eV9cFvVWTgqVtSBvav+dva0dwf6PCW479oM737LrQy
         61AOv0bgt5PKbDbiWWZGOBPWTRNeoc41+izWmy9YiONmmzuzXHjl262wez1C6OyFy9
         G2H3d4nLng6Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691480726; bh=dK8y32VSPfv+uSmARxH/e37aIn+O3g97fmYoKJta8qw=;
        h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
        b=HCsEgBNiY5ROL/dh0khzXv4yMIKED5HaYSQJMzZlqk2US/LX3Xj+P6DYAG/NK/j7V
         dCTVSnhW+fns4ZlYEbXckXiMKWU0XKuStJzWRhhe8HzsGzmKHxhn+xMWlFGkL7ERk5
         wZGRQcXu+X+aTO3EAYyjdbIk7hV1E4C+ThFI9/F5aDtnwnQqe2QBOeaCiVFioYVaOA
         2zdfZntSBr2RE1FMJIJJ4787eV9cFvVWTgqVtSBvav+dva0dwf6PCW479oM737LrQy
         61AOv0bgt5PKbDbiWWZGOBPWTRNeoc41+izWmy9YiONmmzuzXHjl262wez1C6OyFy9
         G2H3d4nLng6Cg==
Message-ID: <1ab766fca893588d75590d2faf624eb7d9d27a8a.camel@triops.cz>
Subject: Re: next: mips: cavium_octeon_defconfig: gcc-8 -
 dwc3-octeon.c:502:8: include/linux/compiler_types.h:397:38: error: call to
 '__compiletime_assert_335' declared with attribute error: FIELD_PREP: value
 too large for the field _compiletime_assert
From:   Ladislav Michl <ladis@triops.cz>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Thinh.Nguyen@synopsys.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Tue, 08 Aug 2023 09:45:25 +0200
In-Reply-To: <CA+G9fYspyEdT9wmVpL04J-p0CwqA+_v_L4H+ihY9VYqpCMmQ1Q@mail.gmail.com>
References: <CA+G9fYspyEdT9wmVpL04J-p0CwqA+_v_L4H+ihY9VYqpCMmQ1Q@mail.gmail.com>
Organization: Triops, s.r.o.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDsx0vWaX5UBDYoWotNwmlrPCGV8ftMgIhITKomVTAP0kzNEBHBWmnQOnh5vNO60zgTtfJv993OMrbVAKAz1bRg3nHt33FGcrb76ESqsdG+MDMmT5gX+
 HK3l8DXcR0nprDy17Bg5HWZ5+9ngoY9JkkI8/QTT+QNbQcUpxWkwM59PQ931npl/c1z6LimwkleA+iDNH5USBWXGDY278fY4daKu+yWuIzSftUgUx45CW3ov
 RmxYAYkdR5chvedeuGAamHCjqkXyVqO/+vdyGApmM9nIP+8LM8m+UaxjxBU+Z5ROIJzG9KWv+oD80C1g/VnwMLRI1ZHyHRQ08nhivGDENIi35kZsD+dDUnSF
 xpbdZ6jryhY2Ivz+Dy/Nxjq9DMGx0j/J3mh7MX5JUJFhe5LdaNhRvhrpVocpBSGjkIWu8Ds2hnYMll5IY4BB2drs4QeIWvhryNs/ZXLg/zfUVKtONwwivDyL
 2XhWDeBo7YrqyXovx7Fe2fsixnWillkBvtVPdcETWl3PhaBCxq0OBO3wRH4=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Naresh,

On Tue, 2023-08-08 at 12:41 +0530, Naresh Kamboju wrote:
> [My two cents]
>=20
> While building Linux next-20230808 mips cavium_octeon_defconfig with
> gcc-8
> failed with below warnings and errors.
>=20
> Build log:
> ----------
>=20
> In function 'dwc3_octeon_setup.isra.4',
> =C2=A0=C2=A0=C2=A0 inlined from 'dwc3_octeon_probe' at drivers/usb/dwc3/d=
wc3-
> octeon.c:502:8:
> include/linux/compiler_types.h:397:38: error: call to
> '__compiletime_assert_335' declared with attribute error: FIELD_PREP:
> value too large for the field
> =C2=A0 _compiletime_assert(condition, msg, __compiletime_assert_,
> __COUNTER__)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^
> include/linux/compiler_types.h:378:4: note: in definition of macro
> '__compiletime_assert'
> =C2=A0=C2=A0=C2=A0 prefix ## suffix();=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 ^~~~~~

Not sure what is really going on there. Code compiles even using 32bit
toochains without warnings and such an assignments are used in other
kernel drivers. See for example drivers/cxl/core/hdm.c:534 which is
using the same types. Also=20
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c in
rvu_exact_prepare_table_entry...

Anyway, let me setup gcc-8 toolchain :)

> =C2=A0 Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> Links:
> -----
> =C2=A0-
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/=
testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
> =C2=A0-
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/=
testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/history/
>=20
> Steps to reproduce:
> ------------
> =C2=A0 tuxmake --runtime podman --target-arch mips --toolchain gcc-8
> --kconfig cavium_octeon_defconfig
> =C2=A0=C2=A0 -
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2TgoAZwerJ28UWHyqf=
QUiaYYhrl/tuxmake_reproducer.sh
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org

