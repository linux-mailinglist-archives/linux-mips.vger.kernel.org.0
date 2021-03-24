Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04544347F63
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 18:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237055AbhCXRc7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 13:32:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236428AbhCXRcn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Mar 2021 13:32:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37D33619DC;
        Wed, 24 Mar 2021 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616607163;
        bh=vwFmLhIbpBit7slP5Tgq8iugG6lF7uxqcxCcj5anb1s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T66PHbzA4HZLyDpwGOkX+dflulPJCr9OD+q4niugzUsfMiI9RRAGz5n7CWXc2WtXR
         XbuhrFmqKLpIwxKmUJDvEVxs0mhwEIxcXsqNURnI1d7/3eFvgOm8abHDCM49/H3Bcf
         qvL2xptThHPDmYcaGptEqEHOkGjiA6p0x7zd8Yv9Vcd68HCUOSUZFJDQAGNgtHdf8Q
         rRu34o4uRbPglSg1LqlwqUB3wXov+O83CJ50wVik8yYYAo0m4PxVbBJR5qtZ7tTQ46
         E7J01J6cM1sxGhyKXm6t2MC4vKiuIMFxUa4kcLH4QmvCSF/wB32I2fLk7RvUSZZCGe
         Poh8Mv+K1J1hw==
Received: by mail-ed1-f48.google.com with SMTP id w18so28625267edc.0;
        Wed, 24 Mar 2021 10:32:43 -0700 (PDT)
X-Gm-Message-State: AOAM530Q+K5XB9HE+hwauwMO1z7JeCszeKEkWuze4JFAQEb4T0CeuhUR
        6MavYDV1BrnnREluyatFMCuGD1oaKoaxjTU4mg==
X-Google-Smtp-Source: ABdhPJy7YCVuRWwXQo13DaEdS0eUAv22DscISVepsqz2isMzM1EIDsAzWe5iU1QCiAYfFd5rzpKJR8h0mAzTPfMAUrg=
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr4667708edr.165.1616607161795;
 Wed, 24 Mar 2021 10:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210309000247.2989531-4-danielwa@cisco.com> <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba> <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
In-Reply-To: <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 24 Mar 2021 11:32:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
Message-ID: <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 24, 2021 at 11:01 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 09/03/2021 =C3=A0 22:29, Daniel Walker a =C3=A9crit :
> > On Tue, Mar 09, 2021 at 08:47:09AM +0100, Christophe Leroy wrote:
> >>
> >>
> >> Le 09/03/2021 =C3=A0 01:02, Daniel Walker a =C3=A9crit :
> >>> This is a scripted mass convert of the config files to use
> >>> the new generic cmdline. There is a bit of a trim effect here.
> >>> It would seems that some of the config haven't been trimmed in
> >>> a while.
> >>
> >> If you do that in a separate patch, you loose bisectability.
> >>
> >> I think it would have been better to do things in a different way, mor=
e or less like I did in my series:
> >> 1/ Provide GENERIC cmdline at the same functionnality level as what is
> >> spread in the different architectures
> >> 2/ Convert architectures to the generic with least churn.
> >> 3/ Add new features to the generic
> >
> > You have to have the churn eventually, no matter how you do it. The onl=
y way you
> > don't have churn is if you never upgrade the feature set.
> >
> >
> >>>
> >>> The bash script used to convert is as follows,
> >>>
> >>> if [[ -z "$1" || -z "$2" ]]; then
> >>>           echo "Two arguments are needed."
> >>>           exit 1
> >>> fi
> >>> mkdir $1
> >>> cp $2 $1/.config
> >>> sed -i 's/CONFIG_CMDLINE=3D/CONFIG_CMDLINE_BOOL=3Dy\nCONFIG_CMDLINE_P=
REPEND=3D/g' $1/.config
> >>
> >> This is not correct.
> >>
> >> By default, on powerpc the provided command line is used only if the b=
ootloader doesn't provide one.
> >>
> >> Otherwise:
> >> - the builtin command line is appended to the one provided by the boot=
loader
> >> if CONFIG_CMDLINE_EXTEND is selected
> >> - the builtin command line replaces to the one provided by the bootloa=
der if
> >> CONFIG_CMDLINE_FORCE is selected
> >
> > I think my changes maintain most of this due to the override of
> > CONFIG_CMDLINE_PREPEND. This is an upgrade and the inflexibility in pow=
erpc is
> > an example of why these changes were created in the first place.
>
> "inflexibility in powerpc" : Can you elaborate ?
>
> >
> > For example , say the default command line is "root=3D/dev/issblk0" fro=
m iss476
> > platform. And the bootloader adds "root=3D/dev/sda1"
> >
> > The result is <prepend><bootloader><append>.
>
>
> I'm still having hard time understanding the benefit of having both <prep=
end> and <append>.
> Could you please provide a complete exemple from real life, ie what exact=
ly the problem is and what
> it solves ?

It doesn't matter. We already have both cases and 'extend' has meant either=
 one.

What someone wants is policy and the kernel shouldn't be defining the polic=
y.

Rob
