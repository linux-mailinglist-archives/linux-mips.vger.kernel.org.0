Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A4A66DFC3
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jan 2023 15:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjAQOAd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Jan 2023 09:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbjAQOAL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Jan 2023 09:00:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1413865E
        for <linux-mips@vger.kernel.org>; Tue, 17 Jan 2023 06:00:07 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g10so22312755wmo.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Jan 2023 06:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U0grQs2LoYK/+4agHiEPH0BC1jVV5rsqbi3ktU4E+Vw=;
        b=jM0nkO/Dd1yfK3Ej/9IgvTf7cljoQNUE3RPkPcfhorEC3wsUGyKtYABzu4RbCC9M0z
         QzSSbh1iIkNC55XSLyYFwUwfP1OxkGz+uzwwaJWx+DV5bE8pija3pmhcXE8FxWtyTU7c
         j0eXm7TKMg8rfww/j+wOi+PSxkh0Zk8lzTC2Vb4AWTs9NeTjgC3Yd52wKv0FOoxIwQAc
         cNm85hb9H/giGXkYwFfb7vePLLBjvU7Tb3smWsLL+1fVdX8xmjMVWYwKY7X4cXN5o6hL
         nPFhUH5Vp/vYm5LcFrLWTIktfOjXrpFRboC4ogqmfws+Wy/ExCfNpp6jNMLOC7xIKR7/
         uxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0grQs2LoYK/+4agHiEPH0BC1jVV5rsqbi3ktU4E+Vw=;
        b=YpgAR/cwp8QP1wpZat1tfWvFa1f0WV3z3HV9XH0GvCTahyD+h6hNv2E/LyONCIuEDp
         lg1CFhKqcp4yoI4LprogHSIO1i+LSH7STbkoM8oJnadSinLUd50EEy1XLMvU98JF0cKX
         QxtGGPDQDrIiq4NfmxBq5s5y8Z/8UxxJ+b5T/Hf1f4itTNuh479pmyYYD1SODSWEpFPb
         Kvc4Z2C+2+wwsIBsRz85+mRxwFc9aotxnkdP4LmWFR3NrI3q+OAlI4DCH0PmLRvLiuV4
         rh57ahksS7H23ugiAFu7/TQDtQ3FnckOhvZA/NzBfcCKgoi3nR82zy6eMVfs3NCOeYNk
         lkrQ==
X-Gm-Message-State: AFqh2kpa8q3mb0h9rsq1Aq0BY/WCXQfXJrkcQOzRh16QGC4K2MwxNrRV
        pJCyE5IDeYR8cuc/MbJTDu76s8j1/80=
X-Google-Smtp-Source: AMrXdXtMJD3Xewy3+wf04XP8/Gkgyzf3Dpveo1GLPmnjjJ8XswTzrau/4bl3JHXzG4UIBV2xp3r+DQ==
X-Received: by 2002:a05:600c:310e:b0:3db:eb0:6f6 with SMTP id g14-20020a05600c310e00b003db0eb006f6mr147032wmo.13.1673964005665;
        Tue, 17 Jan 2023 06:00:05 -0800 (PST)
Received: from DESKTOP-53HLT22 ([39.42.156.237])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c198c00b003d9de0c39fasm46904816wmq.36.2023.01.17.06.00.04
        for <linux-mips@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 17 Jan 2023 06:00:05 -0800 (PST)
Message-ID: <63c6a9e5.050a0220.fcae5.36a9@mx.google.com>
Date:   Tue, 17 Jan 2023 06:00:05 -0800 (PST)
X-Google-Original-Date: 17 Jan 2023 09:01:40 -0500
MIME-Version: 1.0
From:   felixlester984@gmail.com
To:     linux-mips@vger.kernel.org
Subject: TakeOff
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=0D=0AHi,=0D=0A=0D=0ADo you have any estimating projects for us=0D=0A=
=0D=0AIf you are holding a project, please send over the plans in=
 PDF format for getting a firm quote on your project.=0D=0A=0D=0A=
Let me know if you have any questions or if you would like to see=
 some samples.=0D=0A=0D=0AWe will be happy to answer any question=
s you have. Thank you=0D=0A=0D=0ARegards,=0D=0AFelix Lester=0D=0A=
Crossland Estimation, INC

