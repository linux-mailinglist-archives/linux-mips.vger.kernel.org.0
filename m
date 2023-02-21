Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06CC69E2F2
	for <lists+linux-mips@lfdr.de>; Tue, 21 Feb 2023 16:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbjBUPCj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Feb 2023 10:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbjBUPCi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Feb 2023 10:02:38 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807A72B628
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 07:02:34 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id k37so493750wms.0
        for <linux-mips@vger.kernel.org>; Tue, 21 Feb 2023 07:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8LOt52TnL7qqgco82gkhCrGUU8Aq366sJzQBpSTHzLs=;
        b=XB2I3Q/X2sNKn86RrwrFUHpF91bwVfu/H/R8TkUWjpqK+mPdaivxOcEixFhmSu9TO8
         RIVbIzTRBOdWgzgx4InW+MbZuWhj6yhe1SbTnww86GGESehKkEugewbbHjE6/1eoL7cb
         /714YRtPWBz6H5MGBF72kx5mgsWGXVPyoWEei9t+2Pt4IUCNJztrTPc4LAntp5w7R5Tm
         oPTL1mH+ykFxuCpUiUQTRMMeTChRWQDNNVYK97dmmrYmuA/zlhNw0nygCG3OL3BYN1Fo
         0dLDTSXIlfzBR/Szvc5QetE4sKM5b8fLW1XKnq3UAxWQIwB6jLFXx3BdBYo3lEFT6mlS
         tRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LOt52TnL7qqgco82gkhCrGUU8Aq366sJzQBpSTHzLs=;
        b=kSZxPLZfwVrF7hm9HHhogPpVU7TzEWXnsM1b4knCJ6LdVotNEW6nEBsW81Ivd3C7Hh
         pDO2eAzgI+xZ9UrliQ/tzqARjTcmyd0ZrMkQPw7Pdj0QjYta6pnU5HAxlhiiqkI0Y45N
         WMIfKKrKB+FPji3znvG8HVKmE4H4TrLsjnZz/Kebu3eWwMQq6cGUTeNOXBTBqqUez7b3
         U7C0RalrjrORzF/xZ2DZc8GclmP4xSaLVujsTmkgE83Qmac/z9+XZDbYiT4AOE0Domdl
         5sNV1/+KNj5PhqLAgzI31qynBGmp9FqQj8k1x05AJ+JZ0XvR/pv7/bpFk3Orqpx20RwY
         dGqQ==
X-Gm-Message-State: AO0yUKV6HmpyuycjxEth59+ONlxnMTu/QSmKl6BASBXGR8c/yZpgFicz
        L6/aIn3jptcTho7m2ZLNNX9JkqVOgPM=
X-Google-Smtp-Source: AK7set+rQ39fmtANTF8SOfuUhkf7O4oM8lPCJ3IwS4haVUjcxXcM0/JrhtpzxeUqo4qC78QeagjXTA==
X-Received: by 2002:a05:600c:2b0f:b0:3cf:85f7:bbc4 with SMTP id y15-20020a05600c2b0f00b003cf85f7bbc4mr3594648wme.2.1676991752941;
        Tue, 21 Feb 2023 07:02:32 -0800 (PST)
Received: from DESKTOP-L1U6HLH ([39.42.138.70])
        by smtp.gmail.com with ESMTPSA id n3-20020a1c7203000000b003dc522dd25esm5228851wmc.30.2023.02.21.07.02.32
        for <linux-mips@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 21 Feb 2023 07:02:32 -0800 (PST)
Message-ID: <63f4dd08.1c0a0220.ce0c.f45b@mx.google.com>
Date:   Tue, 21 Feb 2023 07:02:32 -0800 (PST)
X-Google-Original-Date: 21 Feb 2023 10:02:33 -0500
MIME-Version: 1.0
From:   trinidad.dreamlandestimation@gmail.com
To:     linux-mips@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,=0D=0A=0D=0AIn case you really want take-offs for a developmen=
t project, we ought to be your consultancy of decision. Reach out=
 to us assuming that you have any undertakings for departure whic=
h could utilize our administrations.=0D=0A=0D=0ASend over the pla=
ns and notice the exact extent of work you need us to assess.=0D=0A=
We will hit you up with a statement on our administration charges=
 and turnaround time.=0D=0AIn case you endorse that individual st=
atement then we will continue further with the gauge.=0D=0A=0D=0A=
For a superior comprehension of our work, go ahead and ask us que=
stions .=0D=0A=0D=0AKind Regards=0D=0ATrinidad Comstock	=0D=0ADre=
amland Estimation, LLC

