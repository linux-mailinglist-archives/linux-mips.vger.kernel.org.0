Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4C0175942
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 12:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgCBLMF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 06:12:05 -0500
Received: from mail-qv1-f52.google.com ([209.85.219.52]:37400 "EHLO
        mail-qv1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgCBLMF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 06:12:05 -0500
Received: by mail-qv1-f52.google.com with SMTP id c19so2439897qvv.4
        for <linux-mips@vger.kernel.org>; Mon, 02 Mar 2020 03:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XRUc+45LtD1Q9J4dvi1Uf3NcLEOh07CnzK1nUW8eKuY=;
        b=D4Yl3bHFnvmgWrNJKz/5EDYzSPIQvEJEkFHrokVHFXkhcVnoP7CU/AFHU66bjXkTO7
         h1AF3egLbA50wdMk1pNkwyLXONM/9sY4pVhuwJkp/EDACQIKLmhUZJsqItPOFU6Pv3Y8
         wi0v9yc9cdPmdSoTUso7T7ponrw2aElMs5MHrPEvvUNFjkBcG/Trg6ZbsBFXeB5QL3ip
         8T3LvbhSaSKvVMwCG5FeT6CaN5lDz+HxpDXsZFna/NkpFcdDmOCFfKGjvLHPVnPw7z87
         2RoSSz1cunxKR0YwSxE8SzW7EUybTYxgPWytCF5k6NLHelI5Dvgd6dQcDrCwatqyb5zp
         HTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XRUc+45LtD1Q9J4dvi1Uf3NcLEOh07CnzK1nUW8eKuY=;
        b=eRAWGiza3FAwWAscfkttDzr3WL1Kd+7ZPKdo/kDQKxC28qLqH5I5ulddFUOkRQpB5b
         XhUs2kFeyDAHRL5kVvenwrJCWaxCJJzecex4Dcylp09i57ns9XNFEwl3FmyZ5gGgy8V9
         lmtGW2r68OxWPVYANiMOY84doRjCVc2MU95iNaRzedARZ3UJV1jt4q2G10C0gDuoSjzK
         jUdUxi8vmP+tGzZu+TshIlucBA6jE8L10pL8Ysat50eFFADIdzDN+yElEGV70UDDYSzy
         gWwMd4dQhPX1JZIoyPYdeQKUAg+XisYjrnNqRP7GQiaGueIM3EDK/4qcEKr4GGzzC7kf
         8/Kw==
X-Gm-Message-State: APjAAAVfWNingTi0KHmt2zDKDd6CaPFOYmrt7S1B0AM2aTkgtIFu6ybi
        SRWmdyErtZSKKwXb9lpkRcDEosj6AFiqx+E9qQQ=
X-Google-Smtp-Source: APXvYqwnOwY0JdrisRrK1h+ZhY3UPdbyBjoYVI27FowDWGFEmoNryyRqmBOHKI6CWshhpFhB72CtYtH7el/oel0Vtc8=
X-Received: by 2002:ad4:4a69:: with SMTP id cn9mr14970715qvb.218.1583147524078;
 Mon, 02 Mar 2020 03:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de> <7cbd08b1-2841-7ffc-eab8-410a77eae083@gentoo.org>
 <CAOLZvyGyjksZWMwFwbTW=WOobnsPQXh-BTU7DReWjBbGxSpF5A@mail.gmail.com>
In-Reply-To: <CAOLZvyGyjksZWMwFwbTW=WOobnsPQXh-BTU7DReWjBbGxSpF5A@mail.gmail.com>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Mon, 2 Mar 2020 19:11:53 +0800
Message-ID: <CAKcpw6XitkcBX5TJcqPWVt6mVpcrgvFZ7UCZztagTtsxAQoHvQ@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     Manuel Lauss <manuel.lauss@gmail.com>
Cc:     Linux-MIPS <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Joshua Kinard <kumba@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Manuel Lauss <manuel.lauss@gmail.com> =E4=BA=8E2020=E5=B9=B43=E6=9C=882=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=884:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Mar 2, 2020 at 12:50 AM Joshua Kinard <kumba@gentoo.org> wrote:
> >
> > On 2/27/2020 09:49, Thomas Bogendoerfer wrote:
> > > Hi,
> > >
> > > we have 47 MIPS system types and I'd like to get an overview how aliv=
e
> > > they really are. I've already grouped the 47 systems a little bit by
> > > hardware I already own and regulary test kernels. Could you please
> > > give me some feedback about the "unclassified" systems ? What systems
> > > are supported by qemu (real test not just repeating qemu docs) ?
> > > Thank you for your help.
>
> I have all Alchemy DB1xxx boards, still working, as well as few MTX-1.
>
> As an aside, does anyone know where to get "newer" MIPS hardware,

Loongson has 64r5 machines.
Ingenic has 32r2+ machines
elvse has 32r5 boards with P5600: http://elveesneotek.com/index.php?id=3D15=
75

> for example with 64bit MipsR6 cores?

You cannot purchase r6 machines yet.
Currently we can only use qemu:
   http://mips64el.bfsu.edu.cn/debian-new/tarball/sid/qemu/

>
> Manuel



--=20
YunQiang Su
