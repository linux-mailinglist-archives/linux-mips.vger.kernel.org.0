Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D796108D2A
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 12:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfKYLsy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 06:48:54 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25783 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfKYLsy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 06:48:54 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574682301; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Zh1hUCvlJMGk6y97KQ2gY/URuGJEHGH5+nMwXLmVUOaGb5XQQGgLQHyu4AbM32/B7nbZQr9PnB9ELnbXxJV9cnjzzFh7ULUYaLuCgxr2oRAfNCDrS1DHw7PIt+ZHKDYKsEXo0T6MlM4fNC4S/EXDjmzzVQZ+wKECbhS3FwMIACk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574682301; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=vR8FHznq9weoQe98IITab9ng2yy00364n8MMah+Ma50=; 
        b=GpSHTS8DBWOKRxkasFoiLcz2UDbeUn79DlB40XYf+0DAc2kz8+xikMtKeKhouA+/679dEx54GK5i69EOFhoZOSimTgx5MFxQLqae2bfJH6S/oq+HU4moCLWJLd9CtWpzgUAkax4q+aE8V2L2puLkBWq7hfGSAUjQIQbd77CD3qM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=lQvQimSMRz0te5LQ+Y3/2PZJNtX30kdHo62qCnmc8N6YVq4W4iKtaQpVg0sHhKj9HQ2sJL3Q2vQP
    8fB4co2XHyWbG9TrcFeQzXAH/dS1FfuRA5qP62fnads5acK0KhVV  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574682301;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=vR8FHznq9weoQe98IITab9ng2yy00364n8MMah+Ma50=;
        b=sYgGKEbh3ZwHUF6NXWO5ICAOJcfCCAcq9LRg5ambTxarGfHp+T5TZCd4Ys5wv8xL
        Q9Ob7ATbJlgcWtUp0KbRDqMkwp5xOGA4Na7B1V2PCWuxQyiHMT989O95TpkkyNk5NoV
        hzzqUL+RUquBBivxMIfRuiROUht3eg8PL20FEa0I=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.185 [171.221.113.185]) by mx.zohomail.com
        with SMTPS id 1574682299618124.63314918176911; Mon, 25 Nov 2019 03:44:59 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, syq@debian.org
Subject: Fix bugs in X1000/X1500 and add X1830 pinctrl driver v5.
Date:   Mon, 25 Nov 2019 19:44:39 +0800
Message-Id: <1574682283-87655-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v4-v5:
Fix compile-time warnings.
Reported-by: kbuild test robot <lkp@intel.com>


