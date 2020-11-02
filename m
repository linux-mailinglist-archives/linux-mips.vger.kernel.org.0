Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A252A22DF
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 03:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgKBCE0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 21:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbgKBCEZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Nov 2020 21:04:25 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF72C0617A6
        for <linux-mips@vger.kernel.org>; Sun,  1 Nov 2020 18:04:24 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id x20so11570313ilj.8
        for <linux-mips@vger.kernel.org>; Sun, 01 Nov 2020 18:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMi4sbS5EayyNfT3+VK+zGYzNb2YLgquW0UaQB7udfA=;
        b=ifuKNzVFPIVEpptVehyHygKIZHFqCWRgsg/K/mc5wOscEgnyPzewu7d5ICahKze4QU
         0qXJkyXEqDDzfSY2vZHKWbJ2b4vtynZeL/IkW6xjFjqISsArjH0KP1FVoW/nwj6E33AX
         O/SAB/ctfn3BV4xM1x7w1Fhy8JuZGQEvFj93CRz//FiluhSwq9cDZcY7aeQ4QufARqtM
         IYQITKyYvMRQIe6WdZeBC1p2wLkiDv8m78GbR5n731wPJQBQSi/kHTghOZERPfueIvWS
         W76zPm0C/8HfW3u/mojgrSCkmqrE02AXBqMfq16wjuG4IRO08KBoIMaeDceLfIelf87B
         9drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMi4sbS5EayyNfT3+VK+zGYzNb2YLgquW0UaQB7udfA=;
        b=EtZ6gMZXU93hvxEh0KS2aol45geofqqCQKSxAN/wLodNeHlq2OxMLpo6nThwIhLCp0
         aDuLdR+HWtreAY7qibPqjXLYiWro2DTvP0EKTFs4FxNNHzv5kjsDhGCOzc7yI0S/ONSP
         PrvMN5mCIinVxo8kezeyZDg1MBL5oH/LiVtDZ9H5Crh66hCJnrTMAv7NHRmh+ZmTNzM6
         E/k9RbaJexXA8lQyfpNYyfG9QKW5VRo17apln8SXeHMTcSdgsxrl5wL6AJybZiMHJK/7
         f7wFNLv/xww7Qn7f7BmWirjNgsMmytml06/GhnCBWlrgv0ePP61dKmSm3sgpGd0B+Vc8
         g2EA==
X-Gm-Message-State: AOAM533KFe3ppAl1ekSJnD1wG3Ob7PHxi/zr7d4JP1mhp+KkKVJtOK/o
        LqkPHDiB1SSZDzV/oLmMLjXsljbeZ7yzlzvAKvqn2ChfLn39+nAc
X-Google-Smtp-Source: ABdhPJwZIg9+M8aqagEQIfCa9Okkamw2C8k/KxbGOJZPkHQx4Gh3/cVRH4iZCw9iFTtCwEwPRX8quLDDO/ykfFNxnp4=
X-Received: by 2002:a92:d908:: with SMTP id s8mr9257300iln.173.1604282663219;
 Sun, 01 Nov 2020 18:04:23 -0800 (PST)
MIME-Version: 1.0
References: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
In-Reply-To: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Mon, 2 Nov 2020 10:04:11 +0800
Message-ID: <CAAhV-H7sp-Opm1W9H8-bKOBo3U0PnM4khavAtbQ=1c-se2BNRQ@mail.gmail.com>
Subject: Re: Kexec on MIPS32R2?
To:     Mauro Condarelli <mc5686@mclink.it>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Mauro,

On Mon, Nov 2, 2020 at 8:02 AM Mauro Condarelli <mc5686@mclink.it> wrote:
>
> Can someone confirm (or disconfirm, of course) kexec is supposed to work on MIPS32R2?
> My attempts to use it on a MT7628-based board result in a silent hang (watchdog cuts in)
> right after:
>
> [  201.309836] kexec_core: Starting new kernel
> [  201.318239] Will call new kernel at 004f0000
> [  201.322581] Bye ...
>
> Apparently old kernel jumps to `do_kexec()` and just dies; new kernel does not give a peep.
> This can be completely my fault, of course, but I would like a confirm this is supposed to work.
>
> Thanks in advance
I think every CPU should add some specific code in
arch/mips/kernel/relocate_kernel.S

Huacai

> Mauro Condarelli
