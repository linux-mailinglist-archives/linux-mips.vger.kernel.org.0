Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A7277488D
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 21:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236505AbjHHTfa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 15:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233376AbjHHTfO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 15:35:14 -0400
X-Greylist: delayed 5100 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Aug 2023 11:50:05 PDT
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D846319ACE
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 11:50:05 -0700 (PDT)
Received: from [192.168.1.166] ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id TIjQqMCSNv5uITIjQqVwRf; Tue, 08 Aug 2023 11:10:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691485825; bh=pxBPGY/8saHyrmYDg9GzSr24b1NP0Ka+vfDcTpfzL/w=;
        h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
        b=nExGr5hNsACSHIq/486b8ATCtVQfhkSRN4G+gqu26YlAlxIaGquG83tZntAgKW0zG
         u6bnhtT00h3LJuNm90aDmh5+gAZ7j8qGgWb7T5jeQBmWEk826K7vE5XpFiLH4SJOMT
         ZdAgy24BcsBIbGds9riyGSHwOcmh392muArlMSU5RE1gxujwAB+SWbD+rGISFBOfMA
         g7xP0ameQdKKdwuUPxhJ9Bk27CvQ8cRWHjyD6PO3df9BkhsnyeRgFNWPi/giSNo7eb
         bovYLWhatRST7jQvZLuACVb7htYa6Lmpkn2zfv4xeX18mvCO7MQMhqH5SrbBqS4uyB
         +zPe44VmXSs/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691485825; bh=pxBPGY/8saHyrmYDg9GzSr24b1NP0Ka+vfDcTpfzL/w=;
        h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
        b=nExGr5hNsACSHIq/486b8ATCtVQfhkSRN4G+gqu26YlAlxIaGquG83tZntAgKW0zG
         u6bnhtT00h3LJuNm90aDmh5+gAZ7j8qGgWb7T5jeQBmWEk826K7vE5XpFiLH4SJOMT
         ZdAgy24BcsBIbGds9riyGSHwOcmh392muArlMSU5RE1gxujwAB+SWbD+rGISFBOfMA
         g7xP0ameQdKKdwuUPxhJ9Bk27CvQ8cRWHjyD6PO3df9BkhsnyeRgFNWPi/giSNo7eb
         bovYLWhatRST7jQvZLuACVb7htYa6Lmpkn2zfv4xeX18mvCO7MQMhqH5SrbBqS4uyB
         +zPe44VmXSs/A==
Message-ID: <567bd0e0e28a4cac4ce13bb314dcf04739598fbc.camel@triops.cz>
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
Date:   Tue, 08 Aug 2023 11:10:23 +0200
In-Reply-To: <1ab766fca893588d75590d2faf624eb7d9d27a8a.camel@triops.cz>
References: <CA+G9fYspyEdT9wmVpL04J-p0CwqA+_v_L4H+ihY9VYqpCMmQ1Q@mail.gmail.com>
         <1ab766fca893588d75590d2faf624eb7d9d27a8a.camel@triops.cz>
Organization: Triops, s.r.o.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP3DisK3KstSzX1Mm3zYKOfoLr30Fb25YJH2esbk2sMTpCEIeraaJY+by4IOCZUiqWJRtJFmW6dOEzTD9+gozpUvY8zkGCwz+srrQejHjrCQDEJwSHy6
 2pW4+0Y2XhJELiSPet442CJ4kW43nKpINuE8xCa7Q3L/cOFyAfe6LIAopIO1Pjky2f6oBSxU3ufb/62bjMyqIH8Vg4aXAC5KnwILVzagZm9cxIOC9QnV0ixH
 6TwbVqZZFxUjMfBQrM2S6MOjhoZVjjKSdyo8fCwmnCpt/eSqKgBS05OWW/ffwSv+DspC4k7jepbmFjh5kDQ60GINPsFVzzeoS0FCU2m45wYeFwhFmkgRPh6M
 +lo+1pdaY3ao2G24RHl8qGWNjD+7dow2M8JIgiy6pf58QmKtJlekiRMYTpVFHgD/vWHSVhqt7ke1mBuua7LEXwsOeWs6FOIsbSutYpgXyK07gEQ2b0y5AJdS
 fNLmZ+Nupmpi5LvDG0Wb8ieIMJE1AnZz2egaHNskaILV6Q57txRoPqwyQtY=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 2023-08-08 at 09:45 +0200, Ladislav Michl wrote:
> Hi Naresh,
>=20
> On Tue, 2023-08-08 at 12:41 +0530, Naresh Kamboju wrote:
> > [My two cents]

seems this is going to be far more expensive ;-)

> > While building Linux next-20230808 mips cavium_octeon_defconfig
> > with gcc-8 failed with below warnings and errors.
> >=20
> > Build log:
> > ----------
> >=20
> > In function 'dwc3_octeon_setup.isra.4',
> > =C2=A0=C2=A0=C2=A0 inlined from 'dwc3_octeon_probe' at drivers/usb/dwc3=
/dwc3-
> > octeon.c:502:8:
> > include/linux/compiler_types.h:397:38: error: call to
> > '__compiletime_assert_335' declared with attribute error:
> > FIELD_PREP:
> > value too large for the field
> > =C2=A0 _compiletime_assert(condition, msg, __compiletime_assert_,
> > __COUNTER__)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^
> > include/linux/compiler_types.h:378:4: note: in definition of macro
> > '__compiletime_assert'
> > =C2=A0=C2=A0=C2=A0 prefix ## suffix();=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0 ^~~~~~
>=20
> Not sure what is really going on there. Code compiles even using
> 32bit toochains without warnings and such an assignments are used in
> other kernel drivers. See for example drivers/cxl/core/hdm.c:534
> which is using the same types. Also=20
> drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c in
> rvu_exact_prepare_table_entry...

So using gcc-8.2.1 20181130 I see the same error. However
drivers/cxl/core/hdm.c still compiler cleanly.

Now USBDRD_UCTL_CTL_H_CLKDIV_SEL is defined as GENMASK_ULL(26, 24).
Making is GENMASK_ULL(27, 24) makes error go away. Also making clk_div
array in dwc3_octeon_get_divider one element shorter makes error go
away.

To me it seems gcc-8 figures out the result of dwc3_octeon_get_divider
can be greater than 7 and produces error. Cannot happen in the real
world. Should we make gcc-8 stand corrected?

> Anyway, let me setup gcc-8 toolchain :)
>=20
> > =C2=A0 Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >=20
> > Links:
> > -----
> > =C2=A0-
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-2023080=
8/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
> > =C2=A0-
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-2023080=
8/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/history/
> >=20
> > Steps to reproduce:
> > ------------
> > =C2=A0 tuxmake --runtime podman --target-arch mips --toolchain gcc-8
> > --kconfig cavium_octeon_defconfig
> > =C2=A0=C2=A0 -
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2TgoAZwerJ28UWHy=
qfQUiaYYhrl/tuxmake_reproducer.sh
> >=20
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
>=20

