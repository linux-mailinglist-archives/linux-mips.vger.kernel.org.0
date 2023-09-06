Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B05793740
	for <lists+linux-mips@lfdr.de>; Wed,  6 Sep 2023 10:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbjIFIjr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Sep 2023 04:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbjIFIjr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Sep 2023 04:39:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2337F9;
        Wed,  6 Sep 2023 01:39:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A1EC433C7;
        Wed,  6 Sep 2023 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693989583;
        bh=EgSSbyJOBHnd/4EOa2ahKurjVeivNq5DWAAzwYZFGds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EvdlkhOVLC7PcqhrIWpzoMX8/iT+BQH+oDNC449WyjMVTTd6m1EXKppIuVEqIusXY
         zS0JWgZ1XYpL1pf1KlC8akpUTUIhn8ZNxDr2hYILdywM4ODUTmKLNBqeJ9Xc9TUOrc
         igsGKU7nSTMHdt4qMSC96o3CuLKW5qSQ3bQxBvYIlWl9Quq/ZH8jCYSO76R4Ze+y5Z
         N6c4mykx7sY4jS8/jnibf49oLTSV93TntYYn13pIjTVPj3AAskPU1+hfTwUGkZzxBa
         7ADk2jgstIPM+q7sy8OqhZwiZw72Jp990JrdYi3g8UeeidYY0mHOiZVNdvqXn0pvOH
         8zoKLBVDv7QNA==
Date:   Wed, 6 Sep 2023 10:39:40 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org, airlied@gmail.com,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
Message-ID: <3prgpsxxnf3hzeqcpjs5r37nfojbkuwk4ezizrwfrcthm666k6@t2q2qcpnfkiu>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
 <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kxpkzqaumwqn3oho"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--kxpkzqaumwqn3oho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 01:16:08PM -0700, Doug Anderson wrote:
> > > ---
> > > This commit is only compile-time tested.
> > >
> > > NOTE: this patch touches a lot more than other similar patches since
> > > the bind() function is long and we want to make sure that we unset
> > > the
> > > drvdata if bind() fails.
> > >
> > > While making this patch, I noticed that the bind() function of this
> > > driver is using "devm" and thus assumes it doesn't need to do much
> > > explicit error handling. That's actually a bug. As per kernel docs
> > > [1]
> > > "the lifetime of the aggregate driver does not align with any of the
> > > underlying struct device instances. Therefore devm cannot be used and
> > > all resources acquired or allocated in this callback must be
> > > explicitly released in the unbind callback". Fixing that is outside
> > > the scope of this commit.
> > >
> > > [1] https://docs.kernel.org/driver-api/component.html
> > >
> >
> > Noted, thanks.
>=20
> FWIW, I think that at least a few other DRM drivers handle this by
> doing some of their resource allocation / acquiring in the probe()
> function and then only doing things in the bind() that absolutely need
> to be in the bind. ;-)

That doesn't change much. The fundamental issue is that the DRM device
sticks around until the last application that has an open fd to it
closes it.

So it doesn't have any relationship with the unbind/remove timing, and
for all we know it can be there indefinitely, while the application
continues to interact with the driver.

Maxime

--kxpkzqaumwqn3oho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPg6zAAKCRDj7w1vZxhR
xbFEAQCjDQ2O0vNfuce5QyuSJzqaejrSu3hFTAaxFc4Q+NVrHgEA0NcILiyPWxc1
pZwXEN8fFDrqhaTkvb3qDboQaxfoHwg=
=QIFe
-----END PGP SIGNATURE-----

--kxpkzqaumwqn3oho--
