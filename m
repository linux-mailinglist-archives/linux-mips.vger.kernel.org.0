Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 776C91787B6
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2020 02:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgCDBs6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Mar 2020 20:48:58 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:38083 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbgCDBs6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Mar 2020 20:48:58 -0500
Received: by mail-qv1-f68.google.com with SMTP id g16so109026qvz.5;
        Tue, 03 Mar 2020 17:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sYxs3okr6xz3c1wRujbZrThx3HO8v9lxNWjW4D0QAIY=;
        b=Ofv0FxF0hSkLnyYIe9Rr1HAEb1VVASHgd4ZTochqnGmbjoLaOlGpab0LfbkfRt7uhj
         CWfFCcwT5oHK9grh/f8SIOocHffGKOAcu2zRZ4OwkrFCYofxvAl2oXFhtzFREpX33VT8
         9wR/HnR6KCNlvB6VnohZtTBeTmqi0lZWYtWw1izfDmtzlWoTmvkC7foe8Tybg/XcKc1G
         DAtLrf7B1SbDGK0Hum43WwV1izuPpXfm/Rf6zvJOE1jf9U3ya5+HRCTARaFLAriIy5+7
         YrB/Fo5ns3d8h0M2rOEAh4qR93GDrkwJm+65sZlbMiQrgjhqZab8+taIwwWcqEmK/WSb
         tv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sYxs3okr6xz3c1wRujbZrThx3HO8v9lxNWjW4D0QAIY=;
        b=iaGx1ToyxvmNWd06qX/ufiXOb6zI16bRZqAX9FA8nIuZWpxtYK+cqw/gD50D0JQzWu
         dHyT1/kLnCnJ8LevqEyeWgbQQ+a439lC5/XTxmI49S7XhGpvCWqs7c+rLhCVp0+FvZPf
         o9Tucj0oO7nidTEzEX3DcpyjNRXYqFOpCQEZ82kLfyyn5ujtsvzmRUwaQ9slwAyhJeih
         uwEXR5nzlCh95Of5pzRRFUSsylWrIkiMt3hy8RAdSMefjQ20NPtj3I3y+ef3dVCdEICR
         1fd3ZnDEvauuV7jaVZSxpG9gLUPQo4FrUTUCJgS8UI8BgMvKX6i0GynfGef3JHSGlv9P
         +JaA==
X-Gm-Message-State: ANhLgQ1jHsW11rzXQF4pnImbkxtPxcBPe4vKRQF983UI4PAuPmcCcVAP
        2fz8/N9k7s3g4UZ94is2qW7dD53xcGFl/cT3kes=
X-Google-Smtp-Source: ADFU+vsww++jDBEFCtYZ/Ot2rFED5HQKKkAnFHpFiBn/IxJ4KB2vYmZugE5Natswxv4iDITu+nybWoAb7Z4uqsZghiY=
X-Received: by 2002:a0c:b920:: with SMTP id u32mr290109qvf.173.1583286537343;
 Tue, 03 Mar 2020 17:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz> <20200212215200.GA2367959@kroah.com>
In-Reply-To: <20200212215200.GA2367959@kroah.com>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Wed, 4 Mar 2020 09:48:46 +0800
Message-ID: <CAKcpw6VczRuMC_KRzP6VRPeZPtmEpVOJE5Fc+JhDH4mWU7jUVg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Re-instate octeon staging drivers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>, linux@roeck-us.net,
        dan.carpenter@oracle.com, willy@infradead.org,
        devel@driverdev.osuosl.org,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2020=E5=B9=B42=E6=9C=8813=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=885:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Feb 05, 2020 at 01:11:10PM +1300, Chris Packham wrote:
> > This series re-instates the octeon drivers that were recently removed a=
nd
> > addresses the build issues that lead to that decision.
> >
> > I've approached Cavium/Marvell about taking a more active interest in g=
etting
> > the code out of staging and into their proper location. No reply on tha=
t (yet).
>
> Good luck with talking to the companies, hopefully that will work.
>
> Anyway, I've applied this series, thanks for this, let's see what breaks
> now :)

Did you meet any problem to merge Chris's patchset?

>
> greg k-h



--=20
YunQiang Su
