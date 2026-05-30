Return-Path: <linux-mips+bounces-14825-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mb0BkvcGmq99QgAu9opvQ
	(envelope-from <linux-mips+bounces-14825-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 14:47:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 660FF60CDD3
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 14:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B715300953A
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2026 12:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB443A380C;
	Sat, 30 May 2026 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hoBuoA7G"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D739B4BB;
	Sat, 30 May 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780145223; cv=none; b=del3d9BtdFWT7EqfeSaKpLqzLPS/gHd2UgvXQ9mnbpt2BN2Xd98JiYvU4U4Zg8+ceTwCfs4ZNCX7Fb1iYeP/vX5KvQoGbPIuVxGz96VgKnXbKusWdHbYyhtmmPm436q6cJvshSuVoh7tI5eXk94mLr7d441KBj+K10XMilS/X/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780145223; c=relaxed/simple;
	bh=GtDwUbkbTiDFIdw5xyK8UPjBWBuNTQ3vFQ61YYZMtXI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G8jvvgSe/XEW5duyeyf6rc9XJtiPKtBIBMIQ/YauxbfYgg35jUf+aixTKaZSDzLTBOXqCz4d3eMxlstSavm9Upgc2NnlaNctAaQPUE7O+PdR3TMi4bpsJfijg/7Gw9O6NpTlDYbloJ6azCD5FNk/PyKcR0vb5hrCDBU86+S1M7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hoBuoA7G; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=92XpvfBcjudylYPhM9mromsMM4Ay6oz3uieYkI5EGZo=; t=1780145220;
	x=1780750020; b=hoBuoA7GuJAPVH3Z/2VCed+tWx48MQFj66YcvEz0YSuo1bDVcJu1hO0slYkz0
	aWtYPlW4RN6o2VGC+lueOzD5UFWhOE8KrmXU06QsN09HYpXtsBcRAWo22fPIwUtpYC43U6mbN2JQk
	D+Yd0Ls6lJ+0j8Vn8B2ac8liHU7TF3gi/5VuLSXPY6gdX2l/eKlQSQEF9xaQmU7/7Su+MKRv5Shgx
	nRe9a3qZwE/9szUQ3hDzCQMBqmU1o010oa02bUgTk41LkyL/V3vk+hGcpeaCwhANghxADD6K8tHqd
	GEXbKeO0gknAsz0xyCFC1zj0a2tiIhQMWx4LG689YMUZrILgbQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wTJ5H-00000003H2G-3YSm; Sat, 30 May 2026 14:46:35 +0200
Received: from p57bd94c1.dip0.t-ipconnect.de ([87.189.148.193] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wTJ5H-00000003sQm-2Hzt; Sat, 30 May 2026 14:46:35 +0200
Message-ID: <e450221c9d212a83a82fe1cf79668a8172f34b52.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] scsi: core: Remove dead code export of
 scsi_device_from_queue
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Catalin Iacob <iacobcatalin@gmail.com>, Thomas Bogendoerfer	
 <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)"	 <chleroy@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker	 <dalias@libc.org>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson	 <andreas@gaisler.com>,
 "James E.J. Bottomley"	 <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen"	 <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org
Date: Sat, 30 May 2026 14:46:34 +0200
In-Reply-To: <20260530-remove-pktcdvd-references-v1-1-aa56941d4315@gmail.com>
References: <20260530-remove-pktcdvd-references-v1-1-aa56941d4315@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14825-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de,linux.ibm.com,ellerman.id.au,kernel.org,users.sourceforge.jp,libc.org,davemloft.net,gaisler.com,HansenPartnership.com,oracle.com,kernel.dk];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[physik.fu-berlin.de:mid,fu-berlin.de:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 660FF60CDD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Catalin,

On Sat, 2026-05-30 at 15:31 +0300, Catalin Iacob wrote:
> Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind some
> CONFIG_CONFIG_CDROM_PKTCDVD* references in defconfigs and around an
> export. Remove them.
>=20
> Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
> ---
> Found this incidentally while looking at kernel sources to understand
> what pktcdvd is
> ---
>  arch/mips/configs/fuloong2e_defconfig    | 1 -
>  arch/mips/configs/ip22_defconfig         | 1 -
>  arch/mips/configs/ip27_defconfig         | 1 -
>  arch/mips/configs/ip30_defconfig         | 1 -
>  arch/mips/configs/jazz_defconfig         | 1 -
>  arch/mips/configs/malta_defconfig        | 1 -
>  arch/mips/configs/malta_kvm_defconfig    | 1 -
>  arch/mips/configs/maltaup_xpa_defconfig  | 1 -
>  arch/mips/configs/rm200_defconfig        | 1 -
>  arch/mips/configs/sb1250_swarm_defconfig | 1 -
>  arch/powerpc/configs/g5_defconfig        | 1 -
>  arch/powerpc/configs/ppc6xx_defconfig    | 1 -
>  arch/sh/configs/sh2007_defconfig         | 1 -
>  arch/sparc/configs/sparc64_defconfig     | 2 --
>  drivers/scsi/scsi_lib.c                  | 8 --------
>  15 files changed, 23 deletions(-)
>=20
> diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fu=
loong2e_defconfig
> index b6fe3c962464..840130a73992 100644
> --- a/arch/mips/configs/fuloong2e_defconfig
> +++ b/arch/mips/configs/fuloong2e_defconfig
> @@ -89,7 +89,6 @@ CONFIG_MTD_CFI_STAA=3Dm
>  CONFIG_MTD_PHYSMAP=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dy
>  CONFIG_BLK_DEV_RAM=3Dm
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_BLK_DEV_SD=3Dy
>  CONFIG_BLK_DEV_SR=3Dy
> diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_de=
fconfig
> index e123848f94ab..61f09cc9ac12 100644
> --- a/arch/mips/configs/ip22_defconfig
> +++ b/arch/mips/configs/ip22_defconfig
> @@ -177,7 +177,6 @@ CONFIG_NET_ACT_SIMP=3Dm
>  CONFIG_NET_ACT_SKBEDIT=3Dm
>  CONFIG_RFKILL=3Dm
>  CONFIG_CONNECTOR=3Dm
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_RAID_ATTRS=3Dm
>  CONFIG_SCSI=3Dy
> diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_de=
fconfig
> index fea0ccee6948..60da9cf71b72 100644
> --- a/arch/mips/configs/ip27_defconfig
> +++ b/arch/mips/configs/ip27_defconfig
> @@ -83,7 +83,6 @@ CONFIG_CFG80211=3Dm
>  CONFIG_MAC80211=3Dm
>  CONFIG_RFKILL=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dy
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_SCSI=3Dy
>  CONFIG_BLK_DEV_SD=3Dy
> diff --git a/arch/mips/configs/ip30_defconfig b/arch/mips/configs/ip30_de=
fconfig
> index 718f3060d9fa..5c2911ff9a87 100644
> --- a/arch/mips/configs/ip30_defconfig
> +++ b/arch/mips/configs/ip30_defconfig
> @@ -77,7 +77,6 @@ CONFIG_NET_ACT_PEDIT=3Dm
>  CONFIG_NET_ACT_SKBEDIT=3Dm
>  # CONFIG_VGA_ARB is not set
>  CONFIG_BLK_DEV_LOOP=3Dy
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_SCSI=3Dy
>  CONFIG_BLK_DEV_SD=3Dy
> diff --git a/arch/mips/configs/jazz_defconfig b/arch/mips/configs/jazz_de=
fconfig
> index a790c2610fd3..dd3486b8d1fc 100644
> --- a/arch/mips/configs/jazz_defconfig
> +++ b/arch/mips/configs/jazz_defconfig
> @@ -33,7 +33,6 @@ CONFIG_BLK_DEV_FD=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dm
>  CONFIG_BLK_DEV_NBD=3Dm
>  CONFIG_BLK_DEV_RAM=3Dm
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_RAID_ATTRS=3Dm
>  CONFIG_SCSI=3Dy
> diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_=
defconfig
> index 81704ec67f09..b10dac71f400 100644
> --- a/arch/mips/configs/malta_defconfig
> +++ b/arch/mips/configs/malta_defconfig
> @@ -224,7 +224,6 @@ CONFIG_BLK_DEV_FD=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dm
>  CONFIG_BLK_DEV_NBD=3Dm
>  CONFIG_BLK_DEV_RAM=3Dy
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_RAID_ATTRS=3Dm
>  CONFIG_BLK_DEV_SD=3Dy
> diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/ma=
lta_kvm_defconfig
> index 82a97f58bce1..bdd5d99884e3 100644
> --- a/arch/mips/configs/malta_kvm_defconfig
> +++ b/arch/mips/configs/malta_kvm_defconfig
> @@ -228,7 +228,6 @@ CONFIG_BLK_DEV_FD=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dm
>  CONFIG_BLK_DEV_NBD=3Dm
>  CONFIG_BLK_DEV_RAM=3Dy
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_RAID_ATTRS=3Dm
>  CONFIG_BLK_DEV_SD=3Dy
> diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/=
maltaup_xpa_defconfig
> index 0f9ef20744f9..523c0ff329ac 100644
> --- a/arch/mips/configs/maltaup_xpa_defconfig
> +++ b/arch/mips/configs/maltaup_xpa_defconfig
> @@ -226,7 +226,6 @@ CONFIG_BLK_DEV_FD=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dm
>  CONFIG_BLK_DEV_NBD=3Dm
>  CONFIG_BLK_DEV_RAM=3Dy
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_RAID_ATTRS=3Dm
>  CONFIG_BLK_DEV_SD=3Dy
> diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_=
defconfig
> index ad9fbd0cbb38..60054e54bc5a 100644
> --- a/arch/mips/configs/rm200_defconfig
> +++ b/arch/mips/configs/rm200_defconfig
> @@ -177,7 +177,6 @@ CONFIG_PARIDE_ON26=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dm
>  CONFIG_BLK_DEV_NBD=3Dm
>  CONFIG_BLK_DEV_RAM=3Dm
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_RAID_ATTRS=3Dm
>  CONFIG_SCSI=3Dy
> diff --git a/arch/mips/configs/sb1250_swarm_defconfig b/arch/mips/configs=
/sb1250_swarm_defconfig
> index 4a25b8d3e507..a50a7c097542 100644
> --- a/arch/mips/configs/sb1250_swarm_defconfig
> +++ b/arch/mips/configs/sb1250_swarm_defconfig
> @@ -43,7 +43,6 @@ CONFIG_FW_LOADER=3Dm
>  CONFIG_CONNECTOR=3Dm
>  CONFIG_BLK_DEV_RAM=3Dy
>  CONFIG_BLK_DEV_RAM_SIZE=3D9220
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_RAID_ATTRS=3Dm
>  CONFIG_BLK_DEV_SD=3Dy
> diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_=
defconfig
> index 5ca1676e6058..647775f6d174 100644
> --- a/arch/powerpc/configs/g5_defconfig
> +++ b/arch/powerpc/configs/g5_defconfig
> @@ -57,7 +57,6 @@ CONFIG_BLK_DEV_LOOP=3Dy
>  CONFIG_BLK_DEV_NBD=3Dm
>  CONFIG_BLK_DEV_RAM=3Dy
>  CONFIG_BLK_DEV_RAM_SIZE=3D65536
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_BLK_DEV_SD=3Dy
>  CONFIG_CHR_DEV_ST=3Dy
>  CONFIG_BLK_DEV_SR=3Dy
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs=
/ppc6xx_defconfig
> index eda1fec7ffd9..5c3e25fd8edd 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -306,7 +306,6 @@ CONFIG_BLK_DEV_LOOP=3Dm
>  CONFIG_BLK_DEV_NBD=3Dm
>  CONFIG_BLK_DEV_RAM=3Dy
>  CONFIG_BLK_DEV_RAM_SIZE=3D16384
> -CONFIG_CDROM_PKTCDVD=3Dm
>  CONFIG_VIRTIO_BLK=3Dm
>  CONFIG_ENCLOSURE_SERVICES=3Dm
>  CONFIG_SENSORS_TSL2550=3Dm
> diff --git a/arch/sh/configs/sh2007_defconfig b/arch/sh/configs/sh2007_de=
fconfig
> index 5d9080499485..f287a41cd38c 100644
> --- a/arch/sh/configs/sh2007_defconfig
> +++ b/arch/sh/configs/sh2007_defconfig
> @@ -45,7 +45,6 @@ CONFIG_NETWORK_SECMARK=3Dy
>  CONFIG_NET_PKTGEN=3Dy
>  CONFIG_BLK_DEV_LOOP=3Dy
>  CONFIG_BLK_DEV_RAM=3Dy
> -CONFIG_CDROM_PKTCDVD=3Dy
>  CONFIG_RAID_ATTRS=3Dy
>  CONFIG_SCSI=3Dy
>  CONFIG_BLK_DEV_SD=3Dy
> diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sp=
arc64_defconfig
> index 632081a262ba..4abea39281cd 100644
> --- a/arch/sparc/configs/sparc64_defconfig
> +++ b/arch/sparc/configs/sparc64_defconfig
> @@ -60,8 +60,6 @@ CONFIG_CONNECTOR=3Dm
>  CONFIG_BLK_DEV_LOOP=3Dm
>  CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
>  CONFIG_BLK_DEV_NBD=3Dm
> -CONFIG_CDROM_PKTCDVD=3Dm
> -CONFIG_CDROM_PKTCDVD_WCACHE=3Dy
>  CONFIG_ATA_OVER_ETH=3Dm
>  CONFIG_SUNVDC=3Dm
>  CONFIG_ATA=3Dy
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 6e8c7a42603e..f836212c2acf 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -2201,14 +2201,6 @@ struct scsi_device *scsi_device_from_queue(struct =
request_queue *q)
> =20
>  	return sdev;
>  }
> -/*
> - * pktcdvd should have been integrated into the SCSI layers, but for his=
torical
> - * reasons like the old IDE driver it isn't.  This export allows it to s=
afely
> - * probe if a given device is a SCSI one and only attach to that.
> - */
> -#ifdef CONFIG_CDROM_PKTCDVD_MODULE
> -EXPORT_SYMBOL_GPL(scsi_device_from_queue);
> -#endif
> =20
>  /**
>   * scsi_block_requests - Utility function used by low-level drivers to p=
revent
>=20
> ---
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> change-id: 20260530-remove-pktcdvd-references-9d5c6362a5de
>=20
> Best regards,
> -- =20
> Catalin Iacob <iacobcatalin@gmail.com>

I think the commit message should rather be:

	scsi: core: Remove remaining references to CONFIG_CDROM_PKTCDVD

or better

	scsi: core: Remove remaining references to package CD/DVD support

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

