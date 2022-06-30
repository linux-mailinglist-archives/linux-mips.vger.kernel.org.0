Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7532056200F
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jun 2022 18:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236045AbiF3QQl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jun 2022 12:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235740AbiF3QQl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jun 2022 12:16:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741932E087
        for <linux-mips@vger.kernel.org>; Thu, 30 Jun 2022 09:16:40 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i25so22534975wrc.13
        for <linux-mips@vger.kernel.org>; Thu, 30 Jun 2022 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=21qz1Z80+Dw1e1d/lyl4lJ/UQsiXbri/GS0RbMTGIhk=;
        b=JbE0Jnlob2uy1TVYLhasNZ4E+qn+rdxhb8C5Zo/eg4qnZrQrxV9jZQlgmpu9i4UHOg
         NIckdUeXBMWcU7Pli3vLHttKjmfYPgaQw+JP1C5kDmEy0boeyCTbQMQQTXkNI8iC3F4W
         FAY9bJ13DbllNdPqbM6USWmI86lbqkNnf9hN2ExgfzsOqO6QV5uIt0mQajQx7svntwgv
         XvSrJJcLk6klAtFyfJl7OIZVJhungYlOLvHFzqdhzSrZK2nuLNxhg54C/81MoQexw3x3
         5fn0w00TBi95YYDEkI3CRVgPflrdcn1vPNGNZHdOEnDT7okYaAKXP590yCc0HtYDSy0l
         P+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=21qz1Z80+Dw1e1d/lyl4lJ/UQsiXbri/GS0RbMTGIhk=;
        b=vc6hYAxsDSiNBiNghMoslsNQFq79KXyTbQbmqH3rBQX5ttNDOt3Z13FlXOVC/mjKtn
         YVxFEQKPqTpJHLrKz1+FTdYWp8j1OeOZIYMc04XhSTTiMVJXT7YjIjQWnUQB8xP3gDcB
         vlOeXm4y70z5pbvMZr2SCju4rFjsa00OCwGitBOrdAUf1KWbHDkZfvyw/C9ja6go4ben
         aJYyrZIFEb/yWkd8FkBlG8iMggldz1vS5F88u5wDxLW5Hpt3+yGjsbsYizFXaRPZTIna
         y6miv1K9qx5oClTejk0KPpDS+On8nbkgBbahR0Nw3QJKE72oD1kDqsoAMoblTBA0+x6r
         tObA==
X-Gm-Message-State: AJIora+HSrLSNHkMA7Wt2YhckGZs10W/dLxHXdIO8HAJNrrsRhA1oSxx
        R0Bc3OZEzXBO3h3no9HoPKgV981aSAZN20hu
X-Google-Smtp-Source: AGRyM1v4KnStRHZ4pCg5NLnzPDzC2H/0uCq+pvY1Ujl3risTCXytM9/+U4XRtLD/8nM8V/MR788m9g==
X-Received: by 2002:a5d:47c8:0:b0:21d:2295:6a05 with SMTP id o8-20020a5d47c8000000b0021d22956a05mr9148843wrc.302.1656605798922;
        Thu, 30 Jun 2022 09:16:38 -0700 (PDT)
Received: from DESKTOP-DLIJ48C ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id g4-20020a5d5544000000b0021a39f5ba3bsm19679427wrw.7.2022.06.30.09.16.38
        for <linux-mips@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 09:16:38 -0700 (PDT)
Message-ID: <62bdcc66.1c69fb81.db68.5dcc@mx.google.com>
Date:   Thu, 30 Jun 2022 09:16:38 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 12:16:40 -0400
MIME-Version: 1.0
From:   rosario.crosslandestimation@gmail.com
To:     linux-mips@vger.kernel.org
Subject: Bid Estimate
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0ARosario Woodcock=0D=0ACrossland Estimating, INC=
=20

