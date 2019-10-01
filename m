Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89DAC40A9
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 21:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfJATIX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 15:08:23 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:55156 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfJATIX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Oct 2019 15:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=Message-ID:Subject:Cc:To:From:Date:in-reply-to;
         bh=pCXhZADSlYDWxpTdZrOF60LS2Vb4x3ektC2jg3S3tQs=; b=gPx1zIf1WK0P6vyHJJedr1UQi
        +mSm8EFwXjLI0JMh3dkRl/6ikjForE99vw4eRxC9vP03ULMU5YvemFIu6QaFxyf9uf4BsnorsXeAS
        OHsuCbxptMdd5G4ppB6wTqLzrsbUjLv6YjfHZJuzOYHLqjPg3+RY86pvT5rHjWComBdwrCi8XVAI3
        q58mrYdIo5chjUkursaPZarQ58JRr11JoE31wTJjzjF/5vZ0pjUmXZK1b9pOo4iTgPkj6fqtcdU8Q
        gll//GxUpEtMqBZ/RWXIkCNx3Ae27Rg1ZVc/sKKaMP2Jc3kVuDZH8TnnDPO7F+3xJ16K/ELlB1kpe
        arsuI3etA==;
Received: from [2001:bc8:3dc9::1] (helo=localhost)
        by srv1.deutnet.info with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNVT-0000oC-OM; Tue, 01 Oct 2019 21:08:19 +0200
Received: from agriveaux by localhost with local (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNVT-00BgLU-8n; Tue, 01 Oct 2019 21:08:19 +0200
Date:   Tue, 1 Oct 2019 21:08:19 +0200
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] MIPS: CI20: DTS: Add nodes to Creator CI20 board
Message-ID: <cover.1569955865.git.agriveaux@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Attemping to make my CI20 more usefull than a paperweight, I add nodes to Devicetree, at this time:

- Add I2C node PMU and RTC. 
- The IW8103 need some work to stay alive because power seem to turn off.
- The leds patch lack of correct option in ci20_defconfig.
- The Cpu patch isn't usefull without SMP support of jz4780.

Alexandre GRIVEAUX (5):
  MIPS: JZ4780: DTS: Add I2C nodes
  MIPS: CI20: DTS: Add I2C nodes
  MIPS: CI20: DTS: Add IW8103 Wifi + bluetooth
  MIPS: CI20: DTS: Add Leds
  MIPS: JZ4780: DTS: Add CPU nodes

  v2 adding previous sended patch: JZ4780: DTS: Add I2C nodes

 arch/mips/boot/dts/ingenic/ci20.dts    | 214 +++++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 103 ++++++++++++
 2 files changed, 317 insertions(+)


base-commit: 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c
-- 
2.20.1

