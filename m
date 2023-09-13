Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D565079EE2B
	for <lists+linux-mips@lfdr.de>; Wed, 13 Sep 2023 18:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjIMQXy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Sep 2023 12:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIMQXx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Sep 2023 12:23:53 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA9290
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 09:23:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991c786369cso5632566b.1
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694622226; x=1695227026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1QrA3uGZF06KrP9j43FE5bJJzYHcP6Hm4nSeW3w90g=;
        b=iDIE/5lN6zISDZN1wNSKoEfWaz3iH9L5lWAMFWE+kO/T0graoR0GAmR0WKDeq7+IKY
         jguJI9g+r7bGJrahSrKQGjMhjKuug9+mlb7eocNWFV/Y4WUnTWEx2IStI7fEF6pmATcX
         R57NW5Ha7JUlXt3wvBOH3hZCBYcbCVE6aAH00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694622226; x=1695227026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1QrA3uGZF06KrP9j43FE5bJJzYHcP6Hm4nSeW3w90g=;
        b=OYObq8NSytZrr2Nw4UyjAi4+920qyORAe7IY2BatGENxKWWzBbFpuAsSKlO/cZZgGm
         kjXXARlAUn6380gZlSRCgoFxoZeywN/QkPCke33++vBknf63wFowlM+CdZmloeKQNv/X
         cAq5LzpsQcVT86C0TNiHrmqniL58Z7UD89hQf/+K8dfQwm9pTgmeRB9k7HHYcoaSho2P
         PPrtzlabp7H7m+c1m2rQz93XC0BWO6AxgmqLkKIga4JO4fpp/mw56kg+bStSQAbhcCdG
         IZglCpHgYfDEZIBwME9QkuG+x2wx5EnUfeghqeu8NwsQDGgyKNnDLAL79ZgaHl31r2M/
         DM9A==
X-Gm-Message-State: AOJu0Yx9V2bCvYUW4v+b810lfC9RbJHKb3AwGu7+oRjJzF2ZBwD6Rnmi
        pHZuwdGC+8P/61LP261HhUPuEOMf1QE+Gd+9Vzl91GBW
X-Google-Smtp-Source: AGHT+IE011qcMBZw2iOPoe+MiMs2B+g3s2bW7zopVu+YSG6Di5Z9zZ5Diu5j/eo0wEAAV2uvRn+DlQ==
X-Received: by 2002:a17:906:74c7:b0:9aa:1020:8c39 with SMTP id z7-20020a17090674c700b009aa10208c39mr2501873ejl.18.1694622225958;
        Wed, 13 Sep 2023 09:23:45 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906390a00b00992e94bcfabsm8634607eje.167.2023.09.13.09.23.45
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 09:23:45 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52fa364f276so14574a12.1
        for <linux-mips@vger.kernel.org>; Wed, 13 Sep 2023 09:23:45 -0700 (PDT)
X-Received: by 2002:a50:a41e:0:b0:523:bdc9:48a9 with SMTP id
 u30-20020a50a41e000000b00523bdc948a9mr195524edb.0.1694622224847; Wed, 13 Sep
 2023 09:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
 <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com> <3prgpsxxnf3hzeqcpjs5r37nfojbkuwk4ezizrwfrcthm666k6@t2q2qcpnfkiu>
In-Reply-To: <3prgpsxxnf3hzeqcpjs5r37nfojbkuwk4ezizrwfrcthm666k6@t2q2qcpnfkiu>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 13 Sep 2023 09:23:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSTP2g1RttMu_9+AGQbMK87MzQO+tw1cZBEJ3g-jAmYg@mail.gmail.com>
Message-ID: <CAD=FV=VSTP2g1RttMu_9+AGQbMK87MzQO+tw1cZBEJ3g-jAmYg@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org, airlied@gmail.com,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, Sep 6, 2023 at 1:39=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> On Tue, Sep 05, 2023 at 01:16:08PM -0700, Doug Anderson wrote:
> > > > ---
> > > > This commit is only compile-time tested.
> > > >
> > > > NOTE: this patch touches a lot more than other similar patches sinc=
e
> > > > the bind() function is long and we want to make sure that we unset
> > > > the
> > > > drvdata if bind() fails.
> > > >
> > > > While making this patch, I noticed that the bind() function of this
> > > > driver is using "devm" and thus assumes it doesn't need to do much
> > > > explicit error handling. That's actually a bug. As per kernel docs
> > > > [1]
> > > > "the lifetime of the aggregate driver does not align with any of th=
e
> > > > underlying struct device instances. Therefore devm cannot be used a=
nd
> > > > all resources acquired or allocated in this callback must be
> > > > explicitly released in the unbind callback". Fixing that is outside
> > > > the scope of this commit.
> > > >
> > > > [1] https://docs.kernel.org/driver-api/component.html
> > > >
> > >
> > > Noted, thanks.
> >
> > FWIW, I think that at least a few other DRM drivers handle this by
> > doing some of their resource allocation / acquiring in the probe()
> > function and then only doing things in the bind() that absolutely need
> > to be in the bind. ;-)
>
> That doesn't change much. The fundamental issue is that the DRM device
> sticks around until the last application that has an open fd to it
> closes it.
>
> So it doesn't have any relationship with the unbind/remove timing, and
> for all we know it can be there indefinitely, while the application
> continues to interact with the driver.

I spent some time thinking about similar issues recently and, assuming
my understanding is correct, I'd at least partially disagree.

Specifically, I _think_ the only thing that's truly required to remain
valid until userspace closes the last open "fd" is the memory for the
"struct drm_device" itself, right? My understanding is that this is
similar to how "struct device" works. The memory backing a "struct
device" has to live until the last client releases a reference to it
even if everything else about a device has gone away. So if it was all
working perfectly then if the Linux driver backing the "struct
drm_device" goes away then we'd release resources and NULL out a bunch
of stuff in the "struct drm_device" but still keep the actual "struct
drm_device" around since userspace still has a reference. Pretty much
all userspace calls would fail, but at least they wouldn't crash. Is
that roughly the gist?

Assuming that's correct, then _most_ of the resource acquiring /
memory allocation can still happen in the device probe() routine and
can still use devm as long as we do something to ensure that any
resources released are no longer pointed to by anything in the "struct
drm_device".

To make it concrete, I think we want this (feel free to correct). For
simplicity, I'm assuming a driver that _doesn't_ use the component
framework:

a) Linux driver probe() happens. The "struct drm_device" is allocated
in probe() by devm_drm_dev_alloc(). This takes a reference to the
"struct drm_device". The device also acquires resources / allocates
memory.

b) Userspace acquires a reference to the "struct drm_device". Refcount
is now 2 (one from userspace, one from the Linux driver).

c) The Linux driver unbinds, presumably because userspace requested
it. From earlier I think we decided that we can't (by design) block
unbind. Once unbind happens then we shouldn't try to keep operating
the device and the driver should stop running. As part of the unbind,
the remove() is called and also "devm" resources are deallocated. If
any of the things freed are pointed to by the "struct drm_device" then
the code needs to NULL them out at this time. Also we should make sure
that any callback functions that userspace could cause to be invoked
return errors. Our code could go away at any point here since
userspace could "rmmod" our module.

d) Eventually userspace releases the reference and the "struct
drm_device" memory gets automatically freed because it was allocated
by devm_drm_dev_alloc()


NOTE: potentially some things could be allocated / managed by
drmm_xyz() function, like drmm_kmalloc() and that could simplify some
things. However, it's not a panacea for everything. Specifically once
the Linux driver unbind finishes then the device isn't functional
anymore.



-Doug
