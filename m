Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB2310340
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 04:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhBEDJc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 22:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhBEDJ0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Feb 2021 22:09:26 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCB8C061794;
        Thu,  4 Feb 2021 19:08:36 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m13so5939408wro.12;
        Thu, 04 Feb 2021 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:sender:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=hqf55dXwvcYwwL4sAkoYuOM6RPu6wxeec88n5sMRYiY=;
        b=fhPHySbut4dTAWvmnaTXTJM+XUEQ8MW2l8njFAAthh188LYbdzoPC8kI7eWPY/CxiS
         jsMvnipBXfgyxdX/NSpMo/EW66E+55qlp7OM493EMYVvkq7b3CyzJBwevr8vY6w3zBQG
         mM6s5ndcQV3U8sMPnieGuwTn5CET3I/BhAHhxZAmpT9+/guwWCYf4o6wMt6FVaC1/Mz+
         /KT/eiEWNDQjqbKuqil3YCUvKHrBZBPNwmWtUcMAIqzf5K7ZFEv+LCpqZY0dzxf279nm
         mYOfMs5c8QvmKEFEE6q7gA2zSHyIhwXqoh+U8bHlA/w+eJWdZbzbyx3GZZukk2oIVY+4
         yjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:sender:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=hqf55dXwvcYwwL4sAkoYuOM6RPu6wxeec88n5sMRYiY=;
        b=PMn5+7DeVG2YJOUDhVnv8M4TS2JYa13vsHSRYwNLtQMFNzJv+MxbvoHaw/V/51Kjlg
         HQ7Coq/PvOqP0vGmpL5koiC8WJdg527e5FL+ST46QDhCT7ebWAXKcw6BCrUYCpxymZBb
         Mo8hrWV1D+igd75MgSXQ1ICeOHNSHtol1QXbCw6M6b4DLl/P0iE6XiBu34dgo7Tpjoqn
         GtzXH1inTMnmvlugY4I+99RqDSm2r4WwHdV2BMfgvYPlmKqTcj9mVqWfwboXSmz2nhXM
         vdPd9SRaVk5aufnq9DxGJyrHr2MSFgzM92N+DqmCbkwoShqwTI21/stIW1CGN/gUVx+8
         /90Q==
X-Gm-Message-State: AOAM533kCSoyAk56AW4A3YPIqoAgF38mggiXQN8PeuoV1O+50PW1bnor
        Aoo7dykE6B8S/il4JrwpokzN8WjUjwHzuA==
X-Google-Smtp-Source: ABdhPJwVSDyzwcKSIGphbs26ptRVznnc9HY+sJTAWfILOOdiRayxAO7YreNbxMj83QPwrMluTti4tg==
X-Received: by 2002:a5d:5502:: with SMTP id b2mr2426293wrv.245.1612494514742;
        Thu, 04 Feb 2021 19:08:34 -0800 (PST)
Received: from [192.168.1.6] ([154.124.28.35])
        by smtp.gmail.com with ESMTPSA id n9sm10836813wrq.41.2021.02.04.19.08.31
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Feb 2021 19:08:34 -0800 (PST)
Message-ID: <601cb6b2.1c69fb81.5ea54.2eab@mx.google.com>
Sender: Skylar Anderson <barr.markimmbayie@gmail.com>
From:   calantha camara <sgt.andersonskylar0@gmail.com>
X-Google-Original-From: calantha camara
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: hi dear
To:     Recipients <calantha@vger.kernel.org>
Date:   Fri, 05 Feb 2021 03:08:28 +0000
Reply-To: calanthac20@gmail.com
X-Mailer: cdcaafe51be8cdb99a1c85906066cad3d0e60e273541515a58395093a7c4e1f0eefb01d7fc4e6278706e9fb8c4dad093c3263345202970888b6b4d817f9e998c032e7d59
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

do you speak Eglish
