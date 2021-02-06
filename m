Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA55311E1E
	for <lists+linux-mips@lfdr.de>; Sat,  6 Feb 2021 15:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhBFO4n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Feb 2021 09:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhBFO4f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Feb 2021 09:56:35 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FA2C06121C
        for <linux-mips@vger.kernel.org>; Sat,  6 Feb 2021 06:55:44 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id jj19so17668425ejc.4
        for <linux-mips@vger.kernel.org>; Sat, 06 Feb 2021 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=gX+uAlXAcTbYPVh4eqgaek2lWFFUGmokRtCTdCjj756HQL0Q6Ly61L7rA25y7OuIZB
         /Xe42gkuSKf1lEXnd6vJLiW9R3JvuqwTBQapghf/0PcJuaiuKxHcRblIMnYrkDtYs96h
         mgUXGK+VNlTHSvOtLDPCNBbvLfA+ZXwwNeYK/lm0KTOeCXNK6BFJ24rknoBJdmErtusK
         Vw/R15BCXedZlkDy0kY1rxviWjvEZlIzF4aQKfL3ZErb2LlYtTVu2B56D7432MgtYc54
         KCN1nd+SaMbauhpSD1Z4nwN3+Ka0qYAEoTgHF5GyRRafMLcGSY25cW4srrMhIFsNKUpd
         E/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=hn2u7ShA+Ho2Ng2TT+O7GHsYuolSDTe9ArQDtkE4SXdjj7fLxZu6tAjPIhYKjSHwwF
         sREo1P55iRTAKJ79Udh+3D7GXUjGmUQkWHcQEKIi2vGgLbiUya/XRKb3n4PFhJ2mTAgU
         POpYAM+xQLlfRvShF1WnLKGbd7LsSTCfP2tD30MfsZ2z4E10cbAsayfZq9ZN22IQUNmu
         1rDYIxqX+cbazw6qIzYvG518VmmkoXDtdwii1fbZMJltG+UyY/nMA9ZyL69PROEtewWm
         fX2AmZ5WTdfs+uOKHd0+ijCJMEniVy2/ZYVpH34wEMqNePrWMUUZPLOtB6mZXRyE6hEU
         o0Ag==
X-Gm-Message-State: AOAM530CqbU0utu9h2WThvKUQg0+6dSfVw2UlpEuWgvECDnqFhDrA7KN
        xmJ6AZxa+lzXkhvjfE+C26Bw8EAweDA4kTzKdkM=
X-Google-Smtp-Source: ABdhPJyjBYmoF9c/5ZDuA38hqJ7IDlTMAP9VRpOSDatHycnayDkv1NRA8n9QC4BB4ElIAIUrxtRnicDhQ2qXUjdWCZQ=
X-Received: by 2002:a17:906:a1c2:: with SMTP id bx2mr9421163ejb.138.1612623343336;
 Sat, 06 Feb 2021 06:55:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:55:42
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:55:42 +0100
Message-ID: <CAGSHw-DrY3pwyNp6CdRrcj62QnhAsZMc3PZWWQAauNkiXTmwgg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
